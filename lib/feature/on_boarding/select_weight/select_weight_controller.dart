import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';

class SelectWeightController with ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;

  SelectWeightController({required this.onboardingRepoService});

  bool _isKg = true; // true = kg, false = libbre (pounds)
  int _selectedIndex = 0;

  bool get isKg => _isKg;
  int get selectedIndex => _selectedIndex;

  /// Generate kg values (0 to 130)
  List<String> get kgList => List.generate(
      131, (index) => (0 + index).toString()); // 131 items from 0 to 130
  List<String> get libbreList => List.generate(
      231, (index) => (0 + index).toString()); // 231 items from 0 to 230

  List<String> get currentList => _isKg ? kgList : libbreList;

  void toggleUnit() {
    _isKg = !_isKg;
    _selectedIndex = 0;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Include this if using a state management pattern (like ChangeNotifier)
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future sendBodyMetrics(
      BuildContext context, String heightValue, String heightUnit) async {
    _isLoading = true;

    notifyListeners();
    try {
      final response = await onboardingRepoService.sendBodyMetrics(
          heightValue: heightValue,
          heightUnit: heightUnit,
          weightValue: currentList[selectedIndex].toString(),
          weightUnit: isKg ? "kg" : "lbs");
      if (response['success'] == true) {
        final bool success = response['success'] == true;
        final String message = response['message'] ?? 'Something went wrong';
        showApiSnackBar(
          context,
          title: "Success",
          message: message,
          isSuccess: success,
        );
        Navigator.pushNamedAndRemoveUntil(
            context, RoutePaths.selectObjective, (route) => false);
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
