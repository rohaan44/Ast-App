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
    debugPrint("\n🚀 ========== LOGIN FLOW START ==========");
    debugPrint("📧 Email: $email");

    _isLoading = true;
    notifyListeners();
    try {
      debugPrint("📞 Calling authRepoService.login()...");
      final response =
          await authRepoService.login(email: email, password: password);

      debugPrint("📦 Response received - success: ${response.success}");
      debugPrint("📦 Response has data: ${response.data != null}");

      if (response.success == true) {
        debugPrint("✅ Login successful!");

        if (response.data?.user?.role != null) {
          role = response.data!.user!.role ?? "";
          debugPrint("👤 User role: $role");
        }

        debugPrint("📨 Sending OTP to: $email");
        final otpResponse = await authRepoService.sendOtp(email: email);
        debugPrint("📨 OTP sent: $otpResponse");

        if (otpResponse == true) {
          if (!context.mounted) return false;
          showApiSnackBar(
            context,
            title: "Success",
            message: "Login successfully",
            isSuccess: true,
          );
          debugPrint("🔄 Navigating to OTP view...");
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutePaths.otpView,
            (route) => false,
          );
          debugPrint("🏁 ========== LOGIN FLOW END (SUCCESS) ==========\n");
          return true;
        }
      } else {
        debugPrint("❌ Login failed - Error: ${response.error}");
        if (!context.mounted) return false;
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response.error}",
          isSuccess: false,
        );
      }
      debugPrint("🏁 ========== LOGIN FLOW END (FAILED) ==========\n");
      return false;
    } catch (e) {
      _isLoading = false;
      debugPrint("💥 EXCEPTION in login: $e");
      debugPrint(e.toString());
      notifyListeners();
      if (context.mounted) {
        showApiSnackBar(
          context,
          title: "Error",
          message: e.toString(),
          isSuccess: false,
        );
      }
      debugPrint("🏁 ========== LOGIN FLOW END (EXCEPTION) ==========\n");
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
