import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectObjectiveController extends ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;

  SelectObjectiveController({required this.onboardingRepoService});
  // --- DATA ---
  // Lists of options to display in the UI
  final List<String> fitnessGoals = [
    'Perdita di grasso',
    'Prestazioni',
    'Idoneità generale',
    'Muscoli',
    'Addominali',
    'Bicipiti',
  ];

  final List<String> experienceLevels = [
    'Principiante',
    'Intermedio',
    'Avanzato',
  ];

  // --- STATE ---
  // Private variables to hold the current state
  final List<String> _selectedGoals = [];
  String? _selectedExperience;

  // --- GETTERS ---
  // Public getters to safely access the state from the UI
  List<String> get selectedGoals => _selectedGoals;
  String? get selectedExperience => _selectedExperience;

  // --- METHODS ---
  // Methods to update the state. Calling notifyListeners() tells the UI to rebuild.

  /// Toggles the selection for a fitness goal. Allows for multiple selections.
  void toggleFitnessGoal(String goal) {
    if (_selectedGoals.contains(goal)) {
      _selectedGoals.remove(goal);
    } else {
      _selectedGoals.add(goal);
    }
    notifyListeners();
  }

  /// Sets the experience level. Allows for only one selection.
  void selectExperience(String level) {
    _selectedExperience = level;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future sendFitnessGoal(context) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await onboardingRepoService.sendFitnessGoal(
          fitnessGoal: selectedGoals, experienceLevel: selectedExperience!);

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
            context, RoutePaths.welcomeView, (route) => false);
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
