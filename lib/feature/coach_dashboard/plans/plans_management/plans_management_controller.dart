import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class PlansManagementController with ChangeNotifier {
  
bool _isTab1 = false;
bool get isTab1 => _isTab1;
set isTab1(bool value){
  _isTab1 = value;
notifyListeners();
}

bool _isTab2 = true;
bool get isTab2 => _isTab2;
set isTab2(bool value){
  _isTab2 = value;
notifyListeners();
}

final List<Map<String, dynamic>> plans = [
  {
    "title": "Fase 1 dell'ipertrofia",
    "createdDate": "15 gennaio 2025",
    "duration": "6 settimane",
  },
  {
    "title": "Nutrizione dei pasti tagliati",
    "createdDate": "15 gennaio 2025",
    "duration": "4 settimane",
  },
  {
    "title": "Fase 1 dell'ipertrofia",
    "createdDate": "15 gennaio 2025",
    "duration": "6 settimane",
  },
  {
    "title": "Nutrizione dei pasti tagliati",
    "createdDate": "15 gennaio 2025",
    "duration": "6 settimane",
  },
];



 final List<Map<String, String>> plansList = [
    {
      "icon": AssetUtils.dumbelIcon,
      "title": "Piano di formazione",
      "subtitle": "Editore"
    },
    {
      "icon": AssetUtils.nutritionIcon,
      "title": "Piano nutrizionale",
      "subtitle": "Editore"
    },
  ];
}