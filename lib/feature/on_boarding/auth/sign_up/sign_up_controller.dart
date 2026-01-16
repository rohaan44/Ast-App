import 'dart:developer';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';

import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepoService authRepoService;
  SignUpController({required this.authRepoService});
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> register(String role, context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      bool canProceedToOtp = false;
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final name = nameController.text.trim();

      // 1️⃣ Try Register
      final registerResponse = await authRepoService.register(
        name: name,
        email: email,
        password: password,
        role: role,
      );

      if (registerResponse.success == true) {
        canProceedToOtp = true;
      }

      // 2️⃣ If user already exists → Login
      else if (registerResponse.error
              ?.toLowerCase()
              .contains("user already exists") ==
          true) {
        final loginResponse = await authRepoService.login(
          email: email,
          password: password,
        );

        if (loginResponse.success == true) {
          canProceedToOtp = true;
        } else {
          _errorMessage =
              loginResponse.error ?? 'Login failed. Please try again.';
        }
      }

      // 3️⃣ Any other error
      else {
        _errorMessage =
            registerResponse.error ?? 'Registration failed. Please try again.';
      }

      // ⛔ Stop if cannot proceed
      if (!canProceedToOtp) {
        _isLoading = false;
        notifyListeners();
        showApiSnackBar(
          context,
          title: "Error",
          message: _errorMessage!,
          isSuccess: false,
        );
        return false;
      }

      // 4️⃣ Send OTP (ONLY ON SUCCESS PATH)
      final otpResponse = await authRepoService.sendOtp(email: email);

      if (otpResponse == true) {
        Navigator.pushNamed(context, RoutePaths.otpView);
        _isLoading = false;
        notifyListeners();
        return true;
      }
      if (otpResponse is Map) {
        _errorMessage =
            otpResponse['message'] ?? otpResponse['error'] ?? 'OTP failed';
      } else {
        _errorMessage = 'OTP sending failed. Please try again.';
      }

      _isLoading = false;
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: _errorMessage!,
        isSuccess: false,
      );
      return false;
    } catch (e) {
      log(e.toString());
      _isLoading = false;

      if (e is DioException && e.response?.data is Map) {
        _errorMessage = e.response!.data['error'] ??
            e.response!.data['message'] ??
            e.message;
      } else {
        _errorMessage = e.toString();
      }

      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: _errorMessage ?? "An error occurred",
        isSuccess: false,
      );
      return false;
    }
  }

//    Future<bool> _sendOtp(String email) async {
//   try {
//     return await authRepoService.sendOtp(email: email);
//   } catch (_) {
//     return false;
//   }
// }

  bool _isObsecure = true;

  bool get isObsecure => _isObsecure;
  set isObsecure(bool value) {
    _isObsecure = value;
    notifyListeners();
  }

  bool get isEmailValid {
    final emailRegex = RegExp(r'^[\w-\.\+]+@([\w-]+\.)+[\w-]{2,}$');
    return emailRegex.hasMatch(emailController.text);
  }

  bool get isPasswordValid {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return passwordRegex.hasMatch(passwordController.text);
  }

  bool get isButtonEnabled =>
      nameController.text.isNotEmpty && isEmailValid && isPasswordValid;

  void onTextChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
