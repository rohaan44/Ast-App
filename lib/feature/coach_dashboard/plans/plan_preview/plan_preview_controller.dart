import 'package:flutter/material.dart';

class PlanPreviewController with ChangeNotifier {
  
  final Map<String, dynamic> planData = {
    "title": "Fase 1 dell’ipertrofia",
    "type": "Formazione",
    "duration": "6 settimane",
    "createdBy": "AST Official",
    "days": [
      {
        "title": "Giorno 1: Corpo intero",
        "exercises": ["Squat", "Panca", "Righe"]
      },
      {
        "title": "Giorno 2: Inferiore",
        "exercises": ["Stacchi", "Affondi"]
      },
      {
        "title": "Giorno 3: Superiore",
        "exercises": ["OHP", "Pull Ups"]
      },
      {
        "title": "Giorno 4: Spingere",
        "exercises": [
          "Panca piana – 4x8",
          "Distensione su panca inclinata – 3x10",
          "Pressa sopra la testa – 3x8",
          "Alzate laterali – 3x12",
          "Schiacciatori di teschi – 3x10"
        ]
      },
      {
        "title": "Giorno 5: Tirare",
        "exercises": [
          "Stacchi da terra – 4x5",
          "Trazioni – 4x8",
          "Rematori con bilanciere – 3x8",
          "Tirate del viso – 3x12",
          "Curl con bilanciere – 3x10"
        ]
      },
      {
        "title": "Giorno 6: Inferiore",
        "exercises": [
          "Squats – 4x8",
          "Squat bulgari – 3x10 per gamba",
          "Stacchi rumeni – 3x8",
          "Leg Press – 3x12",
          "Sollevamento polpacci – 4x15"
        ]
      },
    ]
  };
}