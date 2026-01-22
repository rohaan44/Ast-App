import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BodyMeasurementController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController waistCircumferenceController = TextEditingController();
  TextEditingController flanksController = TextEditingController();
  TextEditingController armController = TextEditingController();
  TextEditingController thighsController = TextEditingController();

  List<File> _selectedImages = [];
  List<File> get selectedImages => _selectedImages;

  BodyMeasurementController() {
    email.addListener(_onTextChanged);
    waistCircumferenceController.addListener(_onTextChanged);
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
      email.text.isNotEmpty &&
      waistCircumferenceController.text.isNotEmpty &&
      armController.text.isNotEmpty &&
      flanksController.text.isNotEmpty &&
      thighsController.text.isNotEmpty;

  @override
  void dispose() {
    email.dispose();
    waistCircumferenceController.dispose();
    flanksController.dispose();
    armController.dispose();
    thighsController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
