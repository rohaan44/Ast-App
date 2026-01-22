import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class ResetPasswordController with ChangeNotifier {
  final AuthRepoService authRepoService;

  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  ResetPasswordController({required this.authRepoService}) {
    passController.addListener(onTextChanged);
    confirmPassController.addListener(onTextChanged);
  }
  bool get isPasswordValid {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return passwordRegex.hasMatch(passController.text);
  }

  bool get isConfirmPasswordValid {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return passwordRegex.hasMatch(confirmPassController.text);
  }

  void onTextChanged() {
    notifyListeners();
  }

  bool _isObsecurePassword = true;

  bool get isObsecurePassword => _isObsecurePassword;
  set isObsecurePassword(bool value) {
    _isObsecurePassword = value;
    notifyListeners();
  }

  bool _isObsecureConfirmPassword = true;

  bool get isObsecureConfirmPassword => _isObsecureConfirmPassword;
  set isObsecureConfirmPassword(bool value) {
    _isObsecureConfirmPassword = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<bool> changePassword(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final success = await runApiCall(
      context: context,
      apiCall: () => authRepoService.changePassword(
        currentPassword: passController.text,
        newPassword: confirmPassController.text,
      ),
      onSuccess: (response) async {
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutePaths.signIn,
            (route) => false,
          );
        }
      },
      errorMessage: "Change Password failed",
    );
    _isLoading = false;
    notifyListeners();
    return success;
  }

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
