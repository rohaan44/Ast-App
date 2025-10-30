
import 'package:flutter/material.dart';

class TrainingPlanController with ChangeNotifier {



  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  } 


    final Map<String, dynamic> planData = {
    "title": "Fase 1 dell’ipertrofia",
    "type": "Formazione",
    "duration": "6 settimane",
    "focus":"Forza/Ipertrofia"
    };


    final Map<String, TextEditingController> controllers = {};

  TextEditingController getController(String key, String initialValue) {
    if (!controllers.containsKey(key)) {
      controllers[key] = TextEditingController(text: initialValue);
    }
    return controllers[key]!;
  }

  void updateText(String key, String value) {
    if (controllers.containsKey(key)) {
      controllers[key]!.text = value;
      controllers[key]!.selection = TextSelection.collapsed(offset: value.length);
    }
    notifyListeners();
  }

  void disposeControllers() {
    for (final c in controllers.values) {
      c.dispose();
    }
    controllers.clear();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  List days = [
    {
      'title': "Giorno 1: Corpo Intero",
      'exercises': ["Squats", "Bench", "Righe"],
    },
    {
      'title': "Giorno 2: Inferiore",
      'exercises': ["Stacchi", "Pull Ups"],
    },
  ];
  List<Map<String, dynamic>> weekPlans = [
    {
      "days": [
        {"title": "Giorno 1: Corpo intero", "exercises": ["Squats", "Bench", "Righe"]},
        {"title": "Giorno 2: Inferiore", "exercises": ["Stacchi", "Pull Ups"]},
      ]
    }
  ];

  void updateDayTitle(int week, int day, String newTitle) {
    weekPlans[week]["days"][day]["title"] = newTitle;
    notifyListeners();
  }

  void updateExercise(int week, int day, int exIndex, String newName) {
    weekPlans[week]["days"][day]["exercises"][exIndex] = newName;
    notifyListeners();
  }

  void addExercise(int week) {
    weekPlans[week]["days"][0]["exercises"].add("Nuovo esercizio");
    notifyListeners();
  }
}