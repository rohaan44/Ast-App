import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:ast_official/utils/asset_utils.dart';

import 'package:flutter/material.dart';

class DashboardHomeScreenController with ChangeNotifier {
  final AppRepoService appRepoService;
  DashboardHomeScreenController({required this.appRepoService});

  int carouselValue = 0;

  void setCarouselValue(int index) {
    carouselValue = index;
    notifyListeners();
  }

  List cardData = [
    {
      "title": "La sessione di allenamento\ndi oggi",
      "subTitle": "Iniziamo con le trazioni di base",
    },
    {
      "title": "Consiglio del coach della settimana",
      "subTitle": "Concentrati sull’idratazione questa\nsettimana 💦",
    },
    {
      "title": "Suggerimento di\nallenamento",
      "subTitle": "Creato su misura per te",
    },
  ];

  Map catType = {
    "title": ["Calorie", "Proteine", "Carboidrati", "Grassi"],
    "calories": ["2200", "150", "250", "70"],
    "iconImage": [
      AssetUtils.fireIcon,
      AssetUtils.meetSliceIcon,
      AssetUtils.breadIcon,
      AssetUtils.pinAppleIcon,
    ]
  };

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = null;
    } else {
      _selectedIndex = index;
    }
    notifyListeners();
  }

  List nextMealList = [
    {
      "img":
          "https://img.freepik.com/free-psd/roasted-chicken-dinner-platter-delicious-feast_632498-25445.jpg",
      "title": "Petto di pollo",
      "subTitle": "Domani alle 13:00pm",
      "prG": "12",
      "crbG": "8",
      "fatsG": "10",
    },
    {
      "img":
          "https://i.pinimg.com/736x/21/94/35/219435e4eada3d92ebdbe65f04fe774a.jpg",
      "title": "Riso",
      "subTitle": "Domani alle 13:00pm",
      "prG": "12",
      "crbG": "8",
      "fatsG": "10",
    },
    {
      "img":
          "https://e7.pngegg.com/pngimages/536/540/png-clipart-caesar-salad-mesclun-salad-dressing-leaf-vegetable-salad-thumbnail.png",
      "title": "Verdure ",
      "subTitle": "Domani alle 13:00pm",
      "prG": "12",
      "crbG": "8",
      "fatsG": "10",
    },
  ];

  bool processing = false;

  void handleSlideComplete(context) async {
    processing = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    processing = false;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic> profileData = {};
  Map<String, dynamic> dailyNutritionData = {};

  bool _isProfileFetched = false;
  bool get isProfileFetched => _isProfileFetched;

  Future<void> getProfileData(
    BuildContext context, {
    bool forceRefresh = false,
  }) async {
    if (_isProfileFetched && !forceRefresh) return;

    _isLoading = true;
    notifyListeners();

    try {
      final profileResponse = await appRepoService.getMyProfile();

      if (profileResponse.success == true) {
        profileData = profileResponse.data?.profile?.toJson() ?? {};
        getMyAssignedMealsData(context);
        _isProfileFetched = true;
      } else {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Error",
            message: profileResponse.error ?? "Failed to load profile",
            isSuccess: false,
          );
        }
        return;
      }
      final nutritionResponse = await appRepoService.getDailyNutrition();

      if (nutritionResponse.success == true) {
        dailyNutritionData = nutritionResponse.data?.toJson() ?? {};
      } else {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Error",
            message: nutritionResponse.error ?? "Failed to load nutrition data",
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        showApiSnackBar(
          context,
          title: "Error",
          message: e.toString(),
          isSuccess: false,
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMyAssignedMealsData(
    BuildContext context, {
    bool forceRefresh = false,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final profileResponse = await appRepoService.getMyAssignedMeals();

      if (profileResponse["success"] == true) {
        if (profileResponse["data"] != null &&
            profileResponse["data"] is List) {
          nextMealList = profileResponse["data"];
        }
      } else {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Error",
            message: profileResponse["error"] ?? "Failed to load profile",
            isSuccess: false,
          );
        }
        return;
      }
    } catch (e) {
      if (context.mounted) {
        showApiSnackBar(
          context,
          title: "Error",
          message: e.toString(),
          isSuccess: false,
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
