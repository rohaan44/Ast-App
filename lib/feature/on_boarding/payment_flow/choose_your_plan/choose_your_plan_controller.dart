import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class ChooseYourPlanController with ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;

  ChooseYourPlanController({required this.onboardingRepoService});

  List plans = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPlanLoaded = false;
  bool get isPlanLoaded => _isPlanLoaded;

  Future<void> getPlans(context) async {
    if (_isPlanLoaded) return;
    try {
      _isLoading = true;
      notifyListeners();
      final response = await onboardingRepoService.getPlans();
      if (response.success == true) {
        plans = response.data!.plans!;
        _isPlanLoaded = true;
        notifyListeners();
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "Server Error",
          isSuccess: false,
        );
      }
    } catch (e) {
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
