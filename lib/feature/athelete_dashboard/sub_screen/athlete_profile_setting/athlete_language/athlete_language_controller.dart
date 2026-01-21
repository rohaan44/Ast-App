import 'package:flutter/material.dart';

class AthleteLanguageController extends ChangeNotifier {
  String _selectedLanguage = "English (US)";
  String get selectedLanguage => _selectedLanguage;

  final List<String> languages = [
    "English (US)",
    "Italiano",
    "Español",
    "Deutsch",
    "Français",
    "العربية (Arabic)",
    "हिन्दी (Hindi)",
  ];

  void selectLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
  }
}
