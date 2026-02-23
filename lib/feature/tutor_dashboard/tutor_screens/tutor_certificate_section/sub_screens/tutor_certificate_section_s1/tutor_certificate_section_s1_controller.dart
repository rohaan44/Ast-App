import 'dart:io';

import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorCertificateSectionS1Controller with ChangeNotifier {
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  bool _notifyStudent = true;
  bool get notifyStudent => _notifyStudent;

  File? _selectedFile;
  File? get selectedFile => _selectedFile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void toggleNotifyStudent(bool value) {
    _notifyStudent = value;
    notifyListeners();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      _selectedFile = File(result.files.single.path!);
      notifyListeners();
    }
  }

  void removeFile() {
    _selectedFile = null;
    notifyListeners();
  }

  bool get isFormValid =>
      expiryDateController.text.isNotEmpty && _selectedFile != null;

  TutorCertificateSectionS1Controller() {
    expiryDateController.addListener(notifyListeners);
  }

  Future<void> renewCertificate(BuildContext context) async {
    if (expiryDateController.text.isEmpty) {
      showApiSnackBar(
        context,
        title: "Errore",
        message: "Inserisci una data di scadenza",
        isSuccess: false,
      );
      return;
    }

    final flowData =
        context.read<FlowDataProvider>().getFlowData(tutorCertificationFlow);
    if (flowData == null || flowData['_id'] == null) {
      showApiSnackBar(
        context,
        title: "Errore",
        message: "Errore nel recupero dei dati del certificato",
        isSuccess: false,
      );
      return;
    }

    final certificationId = flowData['_id'];

    if (_selectedFile == null) {
      showApiSnackBar(
        context,
        title: "Errore",
        message: "Seleziona un file per il certificato",
        isSuccess: false,
      );
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final repoService = context.read<AppRepoService>();
      final response = await repoService.renewCertification(
        certificationId: certificationId,
        expiryDate: expiryDateController.text,
        issueDate: issueDateController.text.isNotEmpty
            ? issueDateController.text
            : null,
        notes: noteController.text,
        filePath: _selectedFile!.path,
        sendEmailNotification: _notifyStudent,
      );

      _isLoading = false;
      notifyListeners();

      if (response['success'] == true || response['status'] == 'success') {
        // Adjust based on actual API response format
        showApiSnackBar(
          context,
          title: "Successo",
          message: "Certificato rinnovato con successo",
          isSuccess: true,
        );
        Navigator.pop(context);
        Navigator.pop(context); // Pop twice to go back to list
      } else {
        showApiSnackBar(
          context,
          title: "Errore",
          message: response['message'] ?? "Errore durante il rinnovo",
          isSuccess: false,
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Errore",
        message: "Si è verificato un errore: $e",
        isSuccess: false,
      );
    }
  }

  @override
  void dispose() {
    expiryDateController.dispose();
    issueDateController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
