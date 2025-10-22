import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class WhatIsYourActivityController with ChangeNotifier {
    Map catType = {
    "type": ["Sedentario", "Super attivo", "Molto attivo", "Poco attivo"],
    "iconImage": [
      AssetUtils.sofaIcon,
      AssetUtils.bicepIcon,
      AssetUtils.walk,
      AssetUtils.weightLifting
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
}
