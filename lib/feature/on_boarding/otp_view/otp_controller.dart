import 'package:flutter/material.dart';

class OtpController with ChangeNotifier {
  final otpTextController = TextEditingController(); 
  @override
  void dispose(){
    super.dispose();
otpTextController.dispose();
  }
}