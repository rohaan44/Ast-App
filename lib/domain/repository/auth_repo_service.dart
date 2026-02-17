import 'package:flutter/foundation.dart';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/data/models/auth_response_model.dart';
import 'package:ast_official/data/repository/auth_repo.dart';

class AuthRepoService {
  final AuthRepository authRepository;

  AuthRepoService({required this.authRepository});

  Future<AuthResponseModel> register(
      {required String email,
      required String password,
      required String name,
      required String role}) async {
    final response = await authRepository.register(
        email: email, password: password, name: name, role: role);

    if (response.success == true && response.data != null) {
      if (response.data!.accessToken != null) {
        debugPrint("ACCESS TOKEN => ${response.data?.accessToken}");
        await AuthStorage.saveToken(response.data!.accessToken!);
      }
      if (response.data!.user?.id != null) {
        debugPrint("ACCESS TOKEN2 => ${response.data?.user?.id}");
        await AuthStorage.saveUserId(response.data!.user!.id!);
      }
      if (response.data!.refreshToken != null) {
        debugPrint("ACCESS TOKEN3 => ${response.data?.refreshToken}");
        await AuthStorage.saveRefreshToken(response.data!.refreshToken!);
      }
      // Save role
      await AuthStorage.saveRole(role);
      return response;
    }

    return response;
  }

  Future<AuthResponseModel> login(
      {required String email, required String password}) async {
    debugPrint("📧 Login attempt for: $email");
    final response =
        await authRepository.login(email: email, password: password);

    debugPrint(
        "📥 Login response - success: ${response.success}, hasData: ${response.data != null}");

    if (response.success == true && response.data != null) {
      debugPrint("🔑 Processing auth tokens...");

      if (response.data!.accessToken != null) {
        debugPrint("💾 Saving access token...");
        await AuthStorage.saveToken(response.data!.accessToken!);
      } else {
        debugPrint("⚠️ No access token in response");
      }

      if (response.data!.user?.id != null) {
        debugPrint("💾 Saving user ID: ${response.data!.user!.id}");
        await AuthStorage.saveUserId(response.data!.user!.id!);
      }

      if (response.data!.refreshToken != null) {
        debugPrint("💾 Saving refresh token...");
        await AuthStorage.saveRefreshToken(response.data!.refreshToken!);
      } else {
        debugPrint("⚠️ No refresh token in response");
      }

      if (response.data!.user?.role != null) {
        debugPrint("💾 Saving role: ${response.data!.user!.role}");
        await AuthStorage.saveRole(response.data!.user!.role!);
      }

      return response;
    }

    debugPrint("❌ Login failed or no data in response");
    return response;
  }

  Future<dynamic> sendOtp({required String email}) async {
    final response = await authRepository.sendOtp(email: email);
    if (response is Map) {
      if (response['success'] == true) {
        return true;
      } else {
        return response;
      }
    }
    return false;
  }

  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String code}) async {
    final response = await authRepository.verifyOtp(email: email, code: code);

    if (response['success'] == true && response['data'] != null) {
      final data = response['data'];

      // Save token if present
      if (data['accessToken'] != null) {
        debugPrint("💾 Saving access token from verify-otp...");
        await AuthStorage.saveToken(data['accessToken']);
      }

      // Save refresh token if present
      if (data['refreshToken'] != null) {
        debugPrint("💾 Saving refresh token from verify-otp...");
        await AuthStorage.saveRefreshToken(data['refreshToken']);
      }

      // Save user ID if present
      if (data['user'] != null && data['user']['id'] != null) {
        debugPrint("💾 Saving user ID from verify-otp...");
        await AuthStorage.saveUserId(data['user']['id']);
      }

      // Save role if present
      if (data['user'] != null && data['user']['role'] != null) {
        debugPrint("💾 Saving role from verify-otp: ${data['user']['role']}");
        await AuthStorage.saveRole(data['user']['role']);
      }
    }

    return response;
  }

  Future<bool> refreshToken() async {
    final refreshToken = await AuthStorage.getRefreshToken();

    if (refreshToken == null) {
      return false;
    }

    try {
      final AuthResponseModel response =
          await authRepository.refreshToken(refreshToken: refreshToken);

      if (response.success == true && response.data != null) {
        final newAccessToken = response.data!.accessToken;
        final newRefreshToken = response.data!.refreshToken;

        if (newAccessToken != null) {
          await AuthStorage.saveToken(newAccessToken);
        }

        if (newRefreshToken != null) {
          await AuthStorage.saveRefreshToken(newRefreshToken);
        }

        return true;
      }

      return false;
    } catch (e) {
      debugPrint("❌ Error during refreshToken: $e");
      return false;
    }
  }

  Future<dynamic> logout() async {
    final response = await authRepository.logout();
    if (response is Map) {
      if (response['success'] == true) {
        return true;
      } else {
        return response;
      }
    }
    return false;
  }

  Future<dynamic> changePassword(
      {required String currentPassword, required String newPassword}) async {
    final response = await authRepository.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
    if (response is Map) {
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
    }
    return false;
  }
}
