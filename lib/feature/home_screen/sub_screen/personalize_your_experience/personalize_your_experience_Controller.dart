import 'package:flutter/material.dart';

class PersonalizYourExperienceController with ChangeNotifier {

bool _isKg = true; 
int _selectedIndex = 0;

bool get isKg => _isKg;
int get selectedIndex => _selectedIndex;

List<String> get kgList =>
    List.generate(131, (index) => (0 + index).toString());
List<String> get libbreList =>
    List.generate(231, (index) => (0 + index).toString());

List<String> get currentList => _isKg ? kgList : libbreList;

void toggleUnit() {
  _isKg = !_isKg;
  _selectedIndex = 0;
   notifyListeners();
}

void setSelectedIndex(int index) {
  _selectedIndex = index;
   notifyListeners();
}
}
