import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BodyMeasurementController extends ChangeNotifier {
  TextEditingController chestController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController flanksController = TextEditingController();
  TextEditingController armController = TextEditingController();
  TextEditingController thighsController = TextEditingController();

  List<File> _selectedImages = [];
  List<File> get selectedImages => _selectedImages;

  BodyMeasurementController() {
    chestController.addListener(_onTextChanged);
    waistController.addListener(_onTextChanged);
    flanksController.addListener(_onTextChanged);
    armController.addListener(_onTextChanged);
    thighsController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    notifyListeners();
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      _selectedImages.add(file);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < _selectedImages.length) {
      _selectedImages.removeAt(index);
      notifyListeners();
    }
  }

  bool get isNextEnabled =>
      chestController.text.isNotEmpty &&
      waistController.text.isNotEmpty &&
      armController.text.isNotEmpty &&
      flanksController.text.isNotEmpty &&
      thighsController.text.isNotEmpty;

  @override
  void dispose() {
    chestController.dispose();
    waistController.dispose();
    flanksController.dispose();
    armController.dispose();
    thighsController.dispose();
    super.dispose();
  }
}
