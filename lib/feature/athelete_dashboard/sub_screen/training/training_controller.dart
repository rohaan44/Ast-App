import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class TrainingViewController with ChangeNotifier {
  final AppRepoService appRepoService;
  TrainingViewController({required this.appRepoService});

  int selectedCategoryIndex = 0;
  void setSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  final List categories = [
    "Tutti",
    "Cardio",
    "Squat",
    "Stretching",
    "News",
    "Movies",
    "Tech",
    "Sports",
  ];

  List workoutPlans = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPlanLoaded = false;
  bool get isPlanLoaded => _isPlanLoaded;

  Future getAllExercises(context) async {
    if (_isPlanLoaded) return;
    try {
      _isLoading = true;
      notifyListeners();
      final response = await appRepoService.getAllExercises();
      if (response.success == true) {
        if (response.data?.exercises != null) {
          workoutPlans = response.data!.exercises!;
        }
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
