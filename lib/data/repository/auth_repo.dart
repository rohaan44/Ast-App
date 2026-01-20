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

  Future refreshToken({required String refreshToken}) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}auth/refresh-token",
        requestBody: {"refreshToken": refreshToken});
    return response;
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

  Future<dynamic> logout() async {
    final response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}auth/logout",
        requestBody: {});
    return response;
  }
}
