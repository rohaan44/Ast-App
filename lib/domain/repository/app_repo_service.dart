import 'package:ast_official/data/models/app_models/get_daily_nutrition_model.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';
import 'package:ast_official/data/repository/app_repo.dart';

class AppRepoService {
  final AppRepo appRepo;

  AppRepoService({required this.appRepo});

  Future<GetMyProfile> getMyProfile() async {
    return appRepo.getMyProfile();
  }

  Future<GetDailyNutrition> getDailyNutrition() async {
    return appRepo.getDailyNutrition();
  }

  Future<GetExercisesResponseModel> getAllExercises(
      {int page = 1, int limit = 20}) async {
    return appRepo.getAllExercises(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getMyAssignedMeals() async {
    return appRepo.getMyAssignedMeals();
  }

  Future<Map<String, dynamic>> updateProfilePicture(
      {required String imagePath}) async {
    return appRepo.updateProfilePicture(imagePath: imagePath);
  }

  Future<GetMyProfile> updateProfile(
      {required String bio,
      required String email,
      required List<String> fitnessGoals,
      required String name,
      required String phone}) async {
    return appRepo.updateProfile(
        bio: bio,
        email: email,
        fitnessGoals: fitnessGoals,
        name: name,
        phone: phone);
  }

  Future<Map<String, dynamic>> getCoaches(
      {int page = 1, int limit = 20}) async {
    return appRepo.getCoaches(page: page, limit: limit);
  }

  // coach flow

  // athelet managemen

  Future<Map<String, dynamic>> getAllMyAtheletes(
      {int page = 1, int limit = 20}) async {
    return appRepo.getAllMyAtheletes(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getAtheletPendingRequest(
      {int page = 1, int limit = 20}) async {
    return appRepo.getAtheletPendingRequest(page: page, limit: limit);
  }

  Future<dynamic> acceptReqAthelet({
    required String status,
  }) async {
    final response = await appRepo.acceptReqAthelet(
      status: status,
    );
    if (response is Map) {
      if (response['success'] == true) {
        return true;
      } else {
        return response;
      }
    }
    return false;
  }

  Future<dynamic> rejectReqAthelet({
    required String status,
  }) async {
    final response = await appRepo.rejectReqAthelet(
      status: status,
    );
    if (response is Map) {
      if (response['success'] == true) {
        return true;
      } else {
        return response;
      }
    }
    return false;
  }

// training plan
  Future<dynamic> createExcercise({
    required String name,
    required String category,
    required String muscleGroup,
    required String description,
    required String videoUrl,
  }) async {
    final response = await appRepo.createExcercise(
        name: name,
        category: category,
        muscleGroup: muscleGroup,
        description: description,
        videoUrl: videoUrl);
    if (response is Map) {
      if (response['success'] == true) {
        return true;
      } else {
        return response;
      }
    }
    return false;
  }
}
