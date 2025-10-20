import 'package:flutter/cupertino.dart';

class PersonHeightController with ChangeNotifier {
   bool _isCm = true; // true = cm, false = piedi
  int _selectedIndex = 0;

  bool get isCm => _isCm;
  int get selectedIndex => _selectedIndex;

  /// Generate cm values (120 to 213)
  List<String> get cmList =>
      List.generate(94, (index) => (120 + index).toString());

  /// Generate feet values (4.1 → 6.9)
  List<String> get piediList {
    List<String> values = [];
    for (double i = 4.1; i <= 6.9; i += 0.1) {
      values.add(i.toStringAsFixed(1));
    }
    return values;
  }

  List<String> get currentList => _isCm ? cmList : piediList;

  void toggleUnit() {
    _isCm = !_isCm;
    _selectedIndex = 0;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}