import 'dart:io';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class AthleteProfileSettingController with ChangeNotifier {
  final AuthRepoService authRepoService;
  final AppRepoService appRepoService;
  AthleteProfileSettingController({
    required this.authRepoService,
    required this.appRepoService,
  });
  File? _profileImage;

  File? get profileImage => _profileImage;
  bool _isNotification = true;

  bool get isNotification => _isNotification;

  set isNotification(bool value) {
    _isNotification = value;
    notifyListeners();
  }

  Map<String, dynamic> _profileData = {};
  Map<String, dynamic> get profileData => _profileData;

  bool _isProfileFetched = false;
  bool get isProfileFetched => _isProfileFetched;

  Future<void> getProfileData(BuildContext context,
      {bool forceRefresh = false}) async {
    if (_isProfileFetched && !forceRefresh) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await appRepoService.getMyProfile();
      if (response.success == true) {
        _profileData = response.data?.profile?.toJson() ?? {};
        _isProfileFetched = true;
      } else {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Error",
            message: response.error ?? "Something went wrong",
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
    } finally {
      _isProfileFetched = true;
      _isLoading = false;
      notifyListeners();
    }
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

  @override
  void dispose() {
    _profileImage = null;
    super.dispose();
  }
}
