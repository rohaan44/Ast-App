import 'package:flutter/cupertino.dart';

class SelectGenderController with ChangeNotifier {
  bool _isMale = false;
  bool get isMale=> _isMale;
  set isMale(bool value){
    _isMale = value;
    notifyListeners();
  }
  
    bool _isFemale = false;
  bool get isFemale=> _isFemale;
  set isFemale(bool value){
    _isFemale = value;
    notifyListeners();
  }
}