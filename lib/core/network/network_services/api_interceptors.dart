import 'dart:developer';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/core/utils/navigation_service.dart';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/data/repository/auth_repo.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  return dio;
}

class AppInterceptors extends Interceptor {
  // Guard flag to prevent re-entering refresh during the retry request
  static bool _isRefreshing = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Check for auth marker
    final bool authRequired = options.headers.containsKey("x-is-auth-required");
    if (authRequired) {
      options.headers.remove("x-is-auth-required");
      // Store it in extra so onResponse can see it
      options.extra["authRequired"] = true;
    }

    log("➡️ REQUEST [${options.method}] => ${options.uri}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final int? statusCode = response.statusCode;
    final bool authRequired = response.requestOptions.extra["authRequired"] ?? false;

    // ── 401 HANDLING ──
    if (statusCode == 401 && authRequired && !_isRefreshing) {
      
      // Skip for auth-related endpoints to avoid loops
      final String path = response.requestOptions.path;
      if (path.contains('auth/refresh-token') || 
          path.contains('auth/login') || 
          path.contains('auth/verify')) {
        log("⚠️ Auth endpoint returned 401 — session unrecoverable");
        await _forceLogout();
        return handler.next(response);
      }

      _isRefreshing = true;
      log("🔄 401 detected on protected route — attempting token refresh...");

      try {
        final authService = AuthRepoService(authRepository: AuthRepository());
        final bool isRefreshed = await authService.refreshToken();

        if (isRefreshed) {
          log("✅ Token refreshed successfully — retrying original request");
          final String? newToken = await AuthStorage.getToken();
          if (newToken != null) {
            final opts = response.requestOptions;
            opts.headers['Authorization'] = "Bearer $newToken";

            // Retry using a fresh Dio to avoid interceptor recursion if it fails again
            final retryResponse = await Dio().fetch(opts);
            _isRefreshing = false;
            return handler.resolve(retryResponse);
          }
        } else {
          log("❌ Token refresh failed — session expired");
          await _forceLogout();
        }
      } catch (e) {
        log("❌ Exception during refresh process: $e");
        await _forceLogout();
      } finally {
        _isRefreshing = false;
      }
    }

    handler.next(response);
  }

  Future<void> _forceLogout() async {
    log("🧹 Clearing session and redirecting to Sign In...");
    await AuthStorage.clearAll();
    NavigationService.navigateAndRemoveUntil(RoutePaths.signIn);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("❌ ERROR [${err.response?.statusCode}] => ${err.requestOptions.uri}");
    log("Message: ${err.message}");

    if (err.response?.data is Map && err.response?.data["message"] != null) {
      err.response?.data["errorMessage"] = err.response?.data["message"];
    }

    handler.next(err);
  }
}
