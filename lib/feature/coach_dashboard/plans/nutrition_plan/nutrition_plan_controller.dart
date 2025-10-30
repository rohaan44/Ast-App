import 'package:flutter/material.dart';
import 'package:ast_official/utils/asset_utils.dart';

class NutritionPlanController with ChangeNotifier {
  int selectedTab = 0;
  List<String> tabs = ["Piano Pasto AI", "Cibo Sostituzione", "Shopping List"];

  void selectTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  Map<String, dynamic> plan = {
    "title": "Piano Alimentare Di Taglio\nGenerato AI",
    "macros": "Macros : 1800 kcal | Protein: 160g | Carbs: 150g | Fats: 55g",
    "progress": 20.0,
    "meals": [
      {
        "title": "Colazione",
        "items": [
          {
            "icon": AssetUtils.nutritionIcon,
            "name": "Farina d'avena + Frullato proteico",
            "secondary": "400 kcal",
            "macros": "30P / 40C / 10F"
          },
          {
            "icon": AssetUtils.nutritionIcon,
            "name": "Yogurt Greco + Frutti Di Bosco",
            "secondary": "480 kcal",
            "macros": "45P / 40C / 15F"
          }
        ]
      },
      {
        "title": "Pranzo",
        "items": [
          {
            "icon": AssetUtils.nutritionIcon,
            "name": "Insalata Di Pollo Alla Griglia",
            "secondary": "220 kcal",
            "macros": "20P / 30C / 15F"
          }
        ]
      },
      {
        "title": "Cena",
        "items": [
          {
            "icon": AssetUtils.nutritionIcon,
            "name": "Yogurt al Salmone + Frutti Di Bosco",
            "secondary": "65 kcal",
            "macros": "20P / 30C / 15F"
          }
        ]
      }
    ]
  };
}
