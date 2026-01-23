import 'package:flutter/material.dart';

class StatusFeedbackController extends ChangeNotifier {
final TextEditingController notesController = TextEditingController();
StatusFeedbackController(){
  notesController.addListener(_onTextChanged);
}
void _onTextChanged() {
  notifyListeners();
}

  int _energyIndex = 0;
  int get energyIndex => _energyIndex;

  int _recoveryIndex = 0;
  int get recoveryIndex => _recoveryIndex;

  bool _isAgreed = false;
  bool get isAgreed => _isAgreed;


  void setEnergyIndex(int index) {
    _energyIndex = index;
    notifyListeners();
  }

  void setRecoveryIndex(int index) {
    _recoveryIndex = index;
    notifyListeners();
  }

  void toggleAgreed() {
    _isAgreed = !_isAgreed;
    notifyListeners();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }
}
