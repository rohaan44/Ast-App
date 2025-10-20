import 'package:flutter/cupertino.dart';

class SelectWeightController with ChangeNotifier {
 bool _isKg = true; // true = kg, false = libbre (pounds)
int _selectedIndex = 0;

bool get isKg => _isKg;
int get selectedIndex => _selectedIndex;

/// Generate kg values (0 to 130)
List<String> get kgList =>
    List.generate(131, (index) => (0 + index).toString()); // 131 items from 0 to 130
List<String> get libbreList =>
    List.generate(231, (index) => (0 + index).toString()); // 231 items from 0 to 230

List<String> get currentList => _isKg ? kgList : libbreList;

void toggleUnit() {
  _isKg = !_isKg;
  _selectedIndex = 0;
   notifyListeners();
}

void setSelectedIndex(int index) {
  _selectedIndex = index;
   notifyListeners(); // Include this if using a state management pattern (like ChangeNotifier)
}
}