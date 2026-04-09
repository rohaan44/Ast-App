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
  bool _isPlanLoaded = false;
  bool get isPlanLoaded => _isPlanLoaded;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
   bool _hasMore = true;
  bool get hasMore => _hasMore;

  int _currentPage = 1;
  final int _limit = 20;

  Future getAllExercises(BuildContext context, {bool loadMore = false}) async {
    if (_isPlanLoaded && !loadMore) return;
    if (_isLoading) return;

    if (!loadMore) {
      _currentPage = 1;
      workoutPlans.clear();
      _hasMore = true;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final response = await appRepoService.getAllExercises(
        page: _currentPage,
        limit: _limit,
      );

      if (response.success == true) {
        List newExercises =
            response.data!.exercises!;

        if (newExercises.isEmpty) {
          _hasMore = false;
        } else {
          workoutPlans.addAll(newExercises);
          _currentPage++;
        }

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
        message: "Something went wrong",
        isSuccess: false,
      );
    } finally {
      _isPlanLoaded = true;
      _isLoading = false;
      notifyListeners();
    }
  }

}
