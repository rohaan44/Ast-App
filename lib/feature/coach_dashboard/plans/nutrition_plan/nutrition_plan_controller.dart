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
            "name": "Farina d'avena + \nFrullato proteico",
            "secondary1": "400 kcal | 30P / 40C / 10F",
            "secondary2": "480 kcal, 45P / 40C / 15F"
          },
          
        ]
      },
      {
        "title": "Pranzo",
        "items": [
          {
            "icon": AssetUtils.dietIcon,
            "name": "Insalata Di\nPollo Alla Griglia",
            "secondary1": "Yogurt Greco + Frutti Di Bosco",
            "secondary2": "220 kcal, 20P / 30C / 15F"
          },
          // {
          //   "icon": "",
          //   "name": "Yogurt Greco + Frutti Di Bosco",
          //   "secondary1": "480 kcal",
          //   "secondary2": "45P / 40C / 15F"
          // }
        ]
      },
      {
        "title": "Cena",
        "items": [
          {
            "icon": AssetUtils.snackIcon,
            "name": "Yogurt al Salmone +\nFrutti Di Bosco",
            "secondary1": "Vendure",
            "secondary2": "65 kcal, 20P / 30C / 15FF"
          }
        ]
      }
    ]
  };


  final Map<String, dynamic> foodSubstitution = {
  "title": "Pranzo",
  "current": {
    
    "name": "Insalata Di Pollo\nAlla Griglia",
    "alt": "Green Yogurt + Berries",
    "macros": "400 kcal, 30P / 40C / 10F",
  },
  "alternatives": [
    {
      "icon": AssetUtils.meatIcon,
      "name": "Petto di tacchino",
      "macros": "400 kcal, 30P / 40C / 10F",
    },
    {
      "icon": AssetUtils.tofuIcon,
      "name": "Tofu",
      "macros": "400 kcal, 30P / 40C / 10F",
    },
    {
      "icon": AssetUtils.salmonIcon,
      "name": "Salmone (più grasso)",
      "macros": "400 kcal, 30P / 40C / 10F",
    },
  ],
  "quickSubs": [
    {"icon": AssetUtils.chickenIcon, "name": "Pollo"},
    {"icon": AssetUtils.riceIcon, "name": "Riso"},
    {"icon": AssetUtils.broccoliIcon, "name": "Broccole"},
  ],
};

 final Map<String, List<String>> shoppingList = {
    "Proteine": [
      "Petto di pollo (1,5 kg)",
      "Salmone (1 kg)",
      "Yogurt greco (6 tazze)"
    ],
    "Carboidrati": [
      "Riso alle mandorle (2 kg)",
      "Olio d'oliva (500 ml)",
      "Burro di arachidi (1 barattolo)"
    ],
    "Verdure/Frutta": [
      "Mela (mezzo kg)",
      "Spinaci 500g",
    ],
  };

  final Set<String> checkedItems = {};

  void toggleItem(String item) {
    if (checkedItems.contains(item)) {
      checkedItems.remove(item);
    } else {
      checkedItems.add(item);
    }
    notifyListeners();
  }
}
