import 'package:flutter/material.dart';

class SuccessController with ChangeNotifier {
   String paymentId = "003753536379333";
  String amountPaid = "€79.00";
  String dateTime = "20 Ago 2025 • 01:03";

  void setPaymentDetails({
    required String id,
    required String amount,
    required String method,
    required String date,
  }) {
    paymentId = id;
    amountPaid = amount;
    // paymentMethod = method;
    dateTime = date;
    notifyListeners();
  }
}