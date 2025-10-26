import 'package:flutter/cupertino.dart';

class AthleteProfileController with ChangeNotifier {
   int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void setTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}