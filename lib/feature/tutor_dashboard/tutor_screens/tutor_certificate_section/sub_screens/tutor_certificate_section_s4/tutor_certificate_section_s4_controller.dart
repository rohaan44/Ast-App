import 'package:flutter/material.dart';

class TutorCertificateSectionS4Controller with ChangeNotifier {
  /// --- Random Students (with details) ---
  final students = [
    {
      "name": "John D.",
      "course": "Padronanza della Nutrizione Sportiva",
      "duration": "12 settimane",
      "completionDate": "22 settembre 2025",
    },
    {
      "name": "Maria L.",
      "course": "Anatomia e Fisiologia per Trainer",
      "duration": "10 settimane",
      "completionDate": "10 ottobre 2025",
    },
    {
      "name": "Luca P.",
      "course": "Biomeccanica del Movimento",
      "duration": "8 settimane",
      "completionDate": "15 agosto 2025",
    },
    {
      "name": "Sophia R.",
      "course": "Tecniche di Allenamento Avanzato",
      "duration": "14 settimane",
      "completionDate": "5 dicembre 2025",
    },
    {
      "name": "Marco T.",
      "course": "Psicologia dello Sport",
      "duration": "6 settimane",
      "completionDate": "1 settembre 2025",
    },
  ];

  final randomCertificateTypes = [
    "Certificato di completamento",
    "Certificato di eccellenza",
    "Certificato di rinnovo",
    "Certificato di merito",
    "Certificato di specializzazione"
  ];

  /// --- Selected States ---
  Map<String, dynamic>? selectedStudent;
  String? selectedCertificateType;

  /// --- Update Methods ---
  void selectStudent(Map<String, dynamic>? student) {
    selectedStudent = student;
    notifyListeners();
  }

  void selectCertificateType(String? type) {
    selectedCertificateType = type;
    notifyListeners();
  }

  /// --- Computed Helper for Certificate Preview ---
  String get studentName => selectedStudent?['name'] ?? "—";
  String get courseTitle =>
      selectedStudent?['course'] ??
      "Seleziona uno studente per vedere i dettagli.";
  String get courseDuration => selectedStudent?['duration'] ?? "—";
  String get completionDate => selectedStudent?['completionDate'] ?? "—";
}
