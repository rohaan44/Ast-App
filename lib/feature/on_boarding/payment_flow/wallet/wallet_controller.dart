import 'package:flutter/material.dart';

class WalletController with ChangeNotifier {
   String? _selectedMethod; // initially null

  String? get selectedMethod => _selectedMethod;

  void selectMethod(String method) {
    _selectedMethod = method;
    notifyListeners();
  }
}