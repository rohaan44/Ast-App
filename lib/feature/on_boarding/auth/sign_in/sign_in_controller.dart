import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepoService authRepoService;
  SignInController({required this.authRepoService});
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool _isObsecure = true;

  bool get isObsecure => _isObsecure;
  set isObsecure(bool value) {
    _isObsecure = value;
    notifyListeners();
  }

  bool _isCheck = false;

  bool get isCheck => _isCheck;
  set isCheck(bool value) {
    _isCheck = value;
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

  bool get isButtonEnabled => isEmailValid && isPasswordValid;
  String _role = "";
  String get role => _role;
  set role(String value) {
    _role = value;
  }

  void onTextChanged() {
    notifyListeners();
  }

  Future<bool> login(
      BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response =
          await authRepoService.login(email: email, password: password);
      if (response.success == true) {
        role = response.data!.user!.role ?? "";
        final otpResponse = await authRepoService.sendOtp(email: email);
        if (otpResponse == true) {
          showApiSnackBar(
            context,
            title: "Success",
            message: "Login successfully",
            isSuccess: true,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutePaths.otpView,
            (route) => false,
          );
          return true;
        }
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response.error}",
          isSuccess: false,
        );
      }
      return false;
    } catch (e) {
      _isLoading = false;
      debugPrint(e.toString());
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
