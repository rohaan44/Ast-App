import 'package:flutter/material.dart';

class TutorCourseSectionS4Controller extends ChangeNotifier {
  final shortDescriptionController = TextEditingController();

  String _selectedType = "";
  String get selectedType => _selectedType;

  String? _uploadedFileName;
  String? get uploadedFileName => _uploadedFileName;

  void setSelectedType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  void setUploadedFileName(String fileName) {
    _uploadedFileName = fileName;
    notifyListeners();
  }

  @override
  void dispose() {
    shortDescriptionController.dispose();
    super.dispose();
  }
}
