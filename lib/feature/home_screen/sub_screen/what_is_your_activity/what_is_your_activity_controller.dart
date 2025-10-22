import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class WhatIsYourActivityController with ChangeNotifier {
  int selectIndex = 0;

  setSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  Map catType = {
    "type": ["Sedentario", "Super attivo", "Molto attivo", "Poco attivo"],
    "iconImage": [
      AssetUtils.sofaIcon,
      AssetUtils.bicepIcon,
      AssetUtils.walk,
      AssetUtils.weightLifting
    ]
  };
}
