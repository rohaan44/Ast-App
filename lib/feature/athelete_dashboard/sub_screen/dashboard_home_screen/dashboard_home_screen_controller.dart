import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardHomeScreenController with ChangeNotifier {
  final AppRepoService appRepoService;
  DashboardHomeScreenController({required this.appRepoService});
  CarouselSliderController carouselController = CarouselSliderController();

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
  

  
}
