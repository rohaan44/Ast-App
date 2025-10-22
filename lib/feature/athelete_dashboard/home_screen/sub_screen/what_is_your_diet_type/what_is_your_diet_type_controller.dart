import 'package:flutter/material.dart';
import 'package:ast_official/utils/asset_utils.dart';

class WhatIsYourDietTypeController extends ChangeNotifier {
  Map<String, List<String>> catType = {
    "type": [
      "Dieta equilibrata",
      "Alta in proteine",
      "Mediterranea",
      "Vegetariana",
      "Vegana",
      "Keto",
      "Basso contenuto di carboidrati"
    ],
    "iconImage": [
      AssetUtils.rice,
      AssetUtils.legPiece,
      AssetUtils.tomato,
      AssetUtils.carrot,
      AssetUtils.brocli,
      AssetUtils.avocado,
      AssetUtils.beef,
    ]
  };

  final List<int> selectedIndexes = [];

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      if (selectedIndexes.length < 3) {
        selectedIndexes.add(index);
      }
    }
    notifyListeners();
  }

  bool isSelected(int index) => selectedIndexes.contains(index);
}
