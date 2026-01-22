import 'package:flutter/material.dart';

class ReviewYourCheckInController extends ChangeNotifier {
  TextEditingController weightLastWeek = TextEditingController();
  TextEditingController weightThisWeek = TextEditingController();
  TextEditingController lifeLastWeek = TextEditingController();
  TextEditingController lifeThisWeek = TextEditingController();
  TextEditingController armLastWeek = TextEditingController();
  TextEditingController armThisWeek = TextEditingController();

  ReviewYourCheckInController() {
    weightLastWeek.addListener(_onTextChanged);
    weightThisWeek.addListener(_onTextChanged);
    lifeLastWeek.addListener(_onTextChanged);
    lifeThisWeek.addListener(_onTextChanged);
    armLastWeek.addListener(_onTextChanged);
    armThisWeek.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    notifyListeners();
  }

  bool get isNext =>
      weightLastWeek.text.isNotEmpty &&
      weightThisWeek.text.isNotEmpty &&
      lifeLastWeek.text.isNotEmpty &&
      lifeThisWeek.text.isNotEmpty &&
      armLastWeek.text.isNotEmpty &&
      armThisWeek.text.isNotEmpty;



  @override
  void dispose() {
    weightLastWeek.dispose();
    weightThisWeek.dispose();
    lifeLastWeek.dispose();
    lifeThisWeek.dispose();
    armLastWeek.dispose();
    armThisWeek.dispose();
    super.dispose();
  }
}
