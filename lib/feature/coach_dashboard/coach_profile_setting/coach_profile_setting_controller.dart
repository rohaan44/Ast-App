import 'dart:io';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class CoachProfileSettingController with ChangeNotifier {
  final AuthRepoService authRepoService;

  CoachProfileSettingController({required this.authRepoService}) {}
  File? _profileImage;

  File? get profileImage => _profileImage;
  bool _isNotification = true;

  bool get isNotification => _isNotification;

  set isNotification(bool value) {
    _isNotification = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<bool> logout(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final success = await runApiCall(
      context: context,
      apiCall: () => authRepoService.logout(),
      onSuccess: (response) async {
        await AuthStorage.clearAll();
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutePaths.selectRole,
            (route) => false,
          );
        }
      },
      errorMessage: "Logout failed",
    );
    _isLoading = false;
    notifyListeners();
    return success;
  }

  /// Pick image using file_picker
  // Future<void> pickProfileImage() async {
  //   try {
  //     final result = await FilePicker.platform.pickFiles(
  //       type: FileType.image,
  //       allowMultiple: false,
  //     );

  //     if (result != null && result.files.single.path != null) {
  //       _profileImage = File(result.files.single.path!);
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     debugPrint("Error picking image: $e");
  //   }
  // }

  /// Delete current image
  void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }
}
