import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
class SelectGenderController with ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;
  SelectGenderController({required this.onboardingRepoService});
  bool _isMale = false;
  bool get isMale=> _isMale;
  set isMale(bool value){
    _isMale = value;
    notifyListeners();
  }
  
    bool _isFemale = false;
  bool get isFemale=> _isFemale;
  set isFemale(bool value){
    _isFemale = value;
    notifyListeners();
  }
bool _isLoading = false;
  bool get isLoading => _isLoading;

Future sendGender(context) async {
    _isLoading = true;
    notifyListeners();
    String gender = '';
    try {
      if(isMale){
        gender = 'male';
      }else if(isFemale){
        gender = 'female';
      }
      final response =
          await onboardingRepoService.sendGender(gender: gender);
      if (response['success'] == true) {
        final bool success = response['success'] == true;
        final String message = response['message'] ?? 'Something went wrong';
        showApiSnackBar(
          context,
          title: "Success",
          message: message,
          isSuccess: success,
        );
        Navigator.pushNamedAndRemoveUntil(context, RoutePaths.personHeight, (route) => false);
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response['message']}",
          isSuccess: false,
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }




}