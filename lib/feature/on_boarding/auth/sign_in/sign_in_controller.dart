import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

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
    print("\n🚀 ========== LOGIN FLOW START ==========");
    print("📧 Email: $email");

    _isLoading = true;
    notifyListeners();
    try {
      print("📞 Calling authRepoService.login()...");
      final response =
          await authRepoService.login(email: email, password: password);

      print("📦 Response received - success: ${response.success}");
      print("📦 Response has data: ${response.data != null}");

      if (response.success == true) {
        print("✅ Login successful!");

        if (response.data?.user?.role != null) {
          role = response.data!.user!.role ?? "";
          print("👤 User role: $role");
        }

        print("📨 Sending OTP to: $email");
        final otpResponse = await authRepoService.sendOtp(email: email);
        print("📨 OTP sent: $otpResponse");

        if (otpResponse == true) {
          showApiSnackBar(
            context,
            title: "Success",
            message: "Login successfully",
            isSuccess: true,
          );
          print("🔄 Navigating to OTP view...");
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutePaths.otpView,
            (route) => false,
          );
          print("🏁 ========== LOGIN FLOW END (SUCCESS) ==========\n");
          return true;
        }
      } else {
        print("❌ Login failed - Error: ${response.error}");
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response.error}",
          isSuccess: false,
        );
      }
      print("🏁 ========== LOGIN FLOW END (FAILED) ==========\n");
      return false;
    } catch (e) {
      _isLoading = false;
      print("💥 EXCEPTION in login: $e");
      debugPrint(e.toString());
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
      print("🏁 ========== LOGIN FLOW END (EXCEPTION) ==========\n");
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
