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
        await AuthStorage.saveToken(response.data!.accessToken!);
      }
      if (response.data!.user?.id != null) {
        await AuthStorage.saveUserId(response.data!.user!.id!);
      }
      if (response.data!.refreshToken != null) {
        await AuthStorage.saveRefreshToken(response.data!.refreshToken!);
      }
      return response;
    }

    return response;
  }


  Future<AuthResponseModel> login(
      {required String email,
      required String password}) async {
    final response = await authRepository.login(
        email: email, password: password);

    if (response.success == true && response.data != null) {
      if (response.data!.accessToken != null) {
        await AuthStorage.saveToken(response.data!.accessToken!);
      }
      if (response.data!.user?.id != null) {
        await AuthStorage.saveUserId(response.data!.user!.id!);
      }
      if (response.data!.refreshToken != null) {
        await AuthStorage.saveRefreshToken(response.data!.refreshToken!);
      }
      return response;
    }

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

 Future <Map<String, dynamic>> verifyOtp({required String email,
      required String code}) async {
    final response = await authRepository.verifyOtp(email: email,
        code: code);
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
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
  } catch (_) {
    return false;
  }
}

}
