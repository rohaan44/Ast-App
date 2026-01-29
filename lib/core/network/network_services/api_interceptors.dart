import 'dart:developer';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/repository/auth_repo.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  return dio;
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log request
    log("➡️ REQUEST");
    log("URL: ${options.baseUrl}${options.path}");
    log("Method: ${options.method}");
    if (options.data != null) log("Body: ${options.data}");
    if (options.headers.isNotEmpty) log("Headers: ${options.headers}");

    // If header "isAuthRequired" is present, inject token
    if (options.headers.containsKey("isAuthRequired")) {
      final token = options.headers["isAuthRequired"];

      options.headers.remove("isAuthRequired");
      options.headers["Authorization"] = token;

      log("🔐 AUTH Token added");
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("⬅️ RESPONSE");
    log("STATUS: ${response.statusCode}");
    log("DATA: ${response.data}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log("❌ ERROR");
    log("MESSAGE: ${err.message}");
    log("******Error StatusCode******\n ${err.response?.statusCode ?? ""}");
    log("RESPONSE: ${err.response?.data}");

    // Refresh Token Logic
    if (err.response?.statusCode == 401 &&
        err.requestOptions.headers.containsKey("Authorization")) {
      try {
        final dioHelper = DioHelper();
        final authRepo = AuthRepository();
        final authService = AuthRepoService(authRepository: authRepo);

        // Prevent infinite loop if refresh token endpoint itself returns 401
        if (err.requestOptions.path.contains('refresh-token')) {
          log("⚠️ Refresh token failed with 401, clearing storage...");
          await AuthStorage.clearAll();
          return handler.next(err);
        }

        log("🔄 Attempting to refresh token...");
        final isRefreshed = await authService.refreshToken();

        if (isRefreshed) {
          log("✅ Token refreshed successfully");
          final newAccessToken = await AuthStorage.getToken();
          if (newAccessToken != null) {
            final options = err.requestOptions;
            options.headers['Authorization'] = "Bearer $newAccessToken";

            final retryResponse = await Dio().fetch(options);
            return handler.resolve(retryResponse);
          }
        } else {
          log("❌ Refresh failed, clearing storage...");
          await AuthStorage.clearAll();
        }
      } catch (e) {
        // Refresh failed
        await AuthStorage.clearAll();
      }
    }

    if (err.response?.data is Map && err.response?.data["message"] != null) {
      err.response?.data["errorMessage"] = err.response?.data["message"];
    }

    super.onError(err, handler);
  }
}
