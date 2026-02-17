import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class AthleteEditProfileController with ChangeNotifier {
  final AppRepoService appRepoService;
  AthleteEditProfileController({required this.appRepoService}) {
    nameController.addListener(notifyListeners);
    emailController.addListener(notifyListeners);
    phoneController.addListener(notifyListeners);
    bioController.addListener(notifyListeners);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  File? _profileImage;

  File? get profileImage => _profileImage;

  void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }

  Future<void> pickProfileImage(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.path != null) {
        _profileImage = File(result.files.single.path!);
        notifyListeners();

        _isLoading = true;
        notifyListeners();

        try {
          final response = await appRepoService.updateProfilePicture(
            imagePath: _profileImage!.path,
          );

          if (context.mounted) {
            showApiSnackBar(
              context,
              title: "Success",
              message: "Profile picture updated successfully",
              isSuccess: true,
            );
          }
        } catch (e) {
          if (context.mounted) {
            showApiSnackBar(
              context,
              title: "Error",
              message: "Failed to upload image: $e",
              isSuccess: false,
            );
          }
          debugPrint("Error uploading image: $e");
          _profileImage = null; // Revert if upload fails
        } finally {
          _isLoading = false;
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map profileData = {};
  bool _isProfileFetched = false;
  bool get isProfileFetched => _isProfileFetched;

  final List<String> _fitnessGoals = [];
  List<String> get fitnessGoals => _fitnessGoals;

  final List<String> allFitnessGoals = [
    'Perdita di grasso',
    'Prestazioni',
    'Idoneità generale',
    'Muscoli',
    'Addominali',
    'Bicipiti',
  ];

  void removeFitnessGoal(int index) {
    _fitnessGoals.removeAt(index);
    notifyListeners();
  }

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
        bio = response.data?.profile?.bio ?? "";
        bioController.text = bio;
        _fitnessGoals.clear();
        _fitnessGoals.addAll(response.data?.profile?.fitnessGoals ?? []);
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
      _isProfileFetched = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await appRepoService.updateProfile(
        bio: bio,
        email: emailController.text,
        fitnessGoals: _fitnessGoals,
        name: nameController.text,
        phone: phoneController.text,
      );
      if (response.success == true) {
        if (context.mounted) {
          showApiSnackBar(
            context,
            title: "Success",
            message: "Profile updated successfully",
            isSuccess: true,
          );

          Navigator.pop(context); // Go back to profile settings after update
        }
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
      debugPrint("Error updating profile: $e");
      _isProfileFetched = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
