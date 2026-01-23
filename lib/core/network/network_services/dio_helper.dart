import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_services/api_interceptors.dart';
import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio = getDio();

  Options baseOptions = Options(
    contentType: "application/json",
    receiveDataWhenStatusError: true,
  );

  // ===================== GET =====================
  Future<dynamic> get({
    required String url,
    bool isAuthRequired = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final token = isAuthRequired ? await AuthStorage.getToken() : null;

    final option = baseOptions.copyWith(
      validateStatus: (status) {
        return status != null && status < 500;
      },
      headers: {
        "Content-Type": "application/json",
        if (isAuthRequired && token != null) "Authorization": "Bearer $token",
        if (headers != null) ...headers,
      },
    );

    try {
      final res = await dio.get(
        url,
        options: option,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ===================== POST =====================
  Future<dynamic> post({
    required String url,
    Object? requestBody,
    bool isMultipart = false,
    FormData? formData,
    bool isAuthRequired = false,
    Map<String, dynamic>? headers,
  }) async {
    print("\n🔍 POST Request Debug:");
    print("📍 URL: $url");
    print("🔐 Auth Required: $isAuthRequired");

    final token = isAuthRequired ? await AuthStorage.getToken() : null;

    if (isAuthRequired) {
      if (token != null) {
        print("✅ Token retrieved: ${token.substring(0, 20)}...");
      } else {
        print("❌ NO TOKEN FOUND in storage!");
      }
    }

    final option = baseOptions.copyWith(
      validateStatus: (status) {
        return status != null && status < 500;
      },
      headers: {
        "Content-Type": "application/json",
        if (isAuthRequired && token != null) "Authorization": "Bearer $token",
        if (headers != null) ...headers,
      },
    );

    print("📤 Headers being sent: ${option.headers}");

    try {
      final res = await dio.post(
        url,
        data: isMultipart ? formData : requestBody,
        options: option,
      );
      print("✅ Response Status: ${res.statusCode}");
      return res.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.response?.statusCode} - ${e.message}");
      throw _handleDioError(e);
    }
  }

  // ===================== PUT =====================
  Future<dynamic> put({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
    Map<String, dynamic>? headers,
  }) async {
    final token = isAuthRequired ? await AuthStorage.getToken() : null;
    final option = baseOptions.copyWith(
      validateStatus: (status) {
        return status != null && status < 500;
      },
      headers: {
        "Content-Type": "application/json",
        if (isAuthRequired && token != null) "Authorization": "Bearer $token",
        if (headers != null) ...headers,
      },
    );

    try {
      final res = await dio.put(
        url,
        data: requestBody,
        options: option,
      );
      return res.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ===================== DELETE =====================
  Future<dynamic> delete({
    required String url,
    Object? requestBody,
    Map<String, dynamic>? headers,
  }) async {
    final option = baseOptions.copyWith(
      validateStatus: (status) {
        return status != null && status < 500;
      },
      headers: {
        "Content-Type": "application/json",
        if (headers != null) ...headers,
      },
    );

    try {
      final res = await dio.delete(
        url,
        data: requestBody,
        options: option,
      );
      return res.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============ CENTRAL ERROR HANDLER ============
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Check your internet.";

      case DioExceptionType.receiveTimeout:
        return "Server is taking too long to respond.";

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? "Server error";
        return "Error $status: $message";

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      default:
        return "Something went wrong. Try again.";
    }
  }
}
