import 'dart:io';

import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class CoachEditProfileController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController spcializationController = TextEditingController();
  TextEditingController certificationController = TextEditingController();
  final AppRepoService appRepoService;

  CoachEditProfileController({required this.appRepoService}) {
    nameController.addListener(notifyListeners);
    emailController.addListener(notifyListeners);
    phoneController.addListener(notifyListeners);
    bioController.addListener(notifyListeners);
  }
  File? _profileImage;

  File? get profileImage => _profileImage;

  void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Map profileData = {};
  bool _isProfileFetched = false;
  bool get isProfileFetched => _isProfileFetched;
  String bio = "";
  String fullName = "";

  Future<void> getProfileData(BuildContext context,
      {bool forceRefresh = false}) async {
    if (_isProfileFetched && !forceRefresh) return;

    _isLoading = true;
    notifyListeners();
    try {
      final response = await appRepoService.getMyProfile();
      if (response.success == true) {
        profileData = response.data?.profile?.toJson() ?? {};
        fullName = response.data?.profile?.fullName ?? "";
        debugPrint("FullName: '$fullName'");
        nameController.text = fullName;
        emailController.text = response.data?.profile?.email ?? "";
        phoneController.text = response.data?.profile?.phone ?? "";
        bio = response.data?.profile?.bio ?? "";
        bioController.text = bio;
        // _fitnessGoals.clear();
        // _fitnessGoals.addAll(response.data?.profile?.fitnessGoals ?? []);
        _isProfileFetched = true;
        debugPrint("profileData: $profileData");
      } else {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Error",
            message: response.error ?? "Something went wrong",
            isSuccess: false,
          );
        }
        _isProfileFetched = false;
      }
    } catch (e) {
      if (context.mounted) {
        showApiSnackBar(
          context,
          title: "Error",
          message: "An unexpected error occurred: $e",
          isSuccess: false,
        );
      }
      debugPrint("Error fetching profile: $e");
    } finally {
      _isProfileFetched = true;
      _isLoading = false;
      notifyListeners();
    }
  }
}
