import 'package:flutter/material.dart';

class AthleteIntegrationController extends ChangeNotifier {
  final Map<String, bool> _connections = {
    "Google Fit": true,
    "Apple Health": false,
    "MyFitnessPal": false,
    "Strava": true,
  };

  Map<String, bool> get connections => _connections;

  void toggleConnection(String name, bool value) {
    _connections[name] = value;
    notifyListeners();
  }
}
