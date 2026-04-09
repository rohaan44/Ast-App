import 'package:ast_official/data/models/auth_response_model.dart';
import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';

class AuthRepository {
  static final DioHelper _dioHelper = DioHelper();

  Future<AuthResponseModel> register(
      {required String email,
      required String password,
      required String name,
      required String role}) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/register",
        requestBody: {
          "role": role,
          "email": email,
          "password": password,
          "name": name
        });
    return AuthResponseModel.fromJson(response);
  }

  Future<AuthResponseModel> login(
      {required String email, required String password}) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/login",
        requestBody: {"email": email, "password": password});
    return AuthResponseModel.fromJson(response);
  }

  Future<AuthResponseModel> refreshToken({required String refreshToken}) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/refresh-token",
        requestBody: {"refreshToken": refreshToken});
    return AuthResponseModel.fromJson(response);
  }

  Future sendOtp({required String email}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}auth/send-otp",
        requestBody: {"email": email, "purpose": "verification"});
    return response;
  }

  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String code}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}auth/verify-otp",
        requestBody: {"email": email, "code": code});
    return response;
  }

  Future<dynamic> changePassword(
      {required String currentPassword, required String newPassword}) async {
    final response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/change-password",
        requestBody: {
          "currentPassword": currentPassword,
          "newPassword": newPassword
        });
    return response;
  }

  Future<dynamic> logout() async {
    final response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}auth/logout",
        requestBody: {});
    return response;
  }

  // ================= OTP LOGIN =================

  Future<dynamic> loginWithOTP({required String email}) async {
    final response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/login-with-otp",
        requestBody: {"email": email});
    return response;
  }

  Future<Map<String, dynamic>> verifyLoginOTP(
      {required String email, required String otp}) async {
    final response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/verify-login-otp",
        requestBody: {"email": email, "otp": otp});
    return response;
  }

  // ================= GET ME =================

  Future<Map<String, dynamic>> getMe() async {
    final response = await _dioHelper.get(
        isAuthRequired: true, url: "${NetworkProperties.baseUrl}auth/me");
    return response;
  }

  // ================= SOCIAL LOGIN =================

  Future<AuthResponseModel> googleLogin({required String idToken}) async {
    final response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/google-login",
        requestBody: {"idToken": idToken});
    return AuthResponseModel.fromJson(response);
  }

  Future<AuthResponseModel> appleLogin({required String identityToken}) async {
    final response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/apple-login",
        requestBody: {"identityToken": identityToken});
    return AuthResponseModel.fromJson(response);
  }
}
