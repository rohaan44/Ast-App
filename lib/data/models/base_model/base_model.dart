abstract class BaseApiResponse {
  bool get success;
  String? get error;
}

class ApiResponse<T> implements BaseApiResponse {
  @override
  final bool success;

  @override
  final String? error;

  final T? data;

  ApiResponse({
    required this.success,
    this.error,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] == true,
      error: json['error'] ?? json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  /// For network / unexpected errors
  factory ApiResponse.failure(String message) {
    return ApiResponse<T>(
      success: false,
      error: message,
    );
  }
}
