import 'package:flutter/material.dart';

class ResetPasswordController with ChangeNotifier {
  
final passController = TextEditingController();
final confirmPassController = TextEditingController();

ResetPasswordController(){
  passController.addListener(onTextChanged);
  confirmPassController.addListener(onTextChanged);
}
 bool get isPasswordValid {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return passwordRegex.hasMatch(passController.text);
  }

  bool get isConfirmPasswordValid {
    return confirmPassController.text == passController.text;
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

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

}