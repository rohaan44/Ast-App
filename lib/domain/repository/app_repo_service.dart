import 'package:ast_official/data/models/app_models/get_checkins_model.dart';
import 'package:ast_official/data/models/app_models/get_daily_nutrition_model.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';
import 'package:ast_official/data/models/app_models/get_role_athelete.dart';
import 'package:ast_official/data/models/base_model/base_model.dart';
import 'package:ast_official/data/repository/app_repo.dart';

class AppRepoService {
  final AppRepo appRepo;

  AppRepoService({required this.appRepo});

  // ================= PROFILE =================

  Future<GetMyProfile> getMyProfile() async {
    return appRepo.getMyProfile();
  }

  Future<Map<String, dynamic>> getCoachProfileById({required String id}) async {
    return appRepo.getCoachProfileById(id: id);
  }

  Future<Map<String, dynamic>> updateProfilePicture({
    required String imagePath,
  }) async {
    return appRepo.updateProfilePicture(imagePath: imagePath);
  }

  Future<GetMyProfile> updateProfile({
    required String bio,
    required String email,
    required List<String> fitnessGoals,
    required String name,
    required String phone,
  }) async {
    return appRepo.updateProfile(
      bio: bio,
      email: email,
      fitnessGoals: fitnessGoals,
      name: name,
      phone: phone,
    );
  }

  // ================= NUTRITION =================

  Future<GetDailyNutrition> getDailyNutrition() async {
    return appRepo.getDailyNutrition();
  }

  Future<Map<String, dynamic>> getMyAssignedMeals() async {
    return appRepo.getMyAssignedMeals();
  }

  // ================= EXERCISES =================

  Future<GetExercisesResponseModel> getAllExercises({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getAllExercises(page: page, limit: limit);
  }

  // ================= COACH =================

  Future<Map<String, dynamic>> getCoaches({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCoaches(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> sendCoachRequest({required String coachId}) async {
    return appRepo.sendCoachRequest(coachId: coachId);
  }

  // ================= ATHLETE =================

  Future<GetRollAthleteResponseModel> getRoleAthlete({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getRoleAthlete(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getAllMyAtheletes({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getAllMyAtheletes(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getAtheletPendingRequest({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getAtheletPendingRequest(page: page, limit: limit);
  }

  Future<dynamic> acceptReqAthelet({
    required String status,
  }) async {
    final response = await appRepo.acceptReqAthelet(status: status);
    if (response is Map) {
      return response['success'] == true ? true : response;
    }
    return false;
  }

  Future<dynamic> rejectReqAthelet({
    required String status,
  }) async {
    final response = await appRepo.rejectReqAthelet(status: status);
    if (response is Map) {
      return response['success'] == true ? true : response;
    }
    return false;
  }

  // ================= TRAINING / PLANS =================

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
      videoUrl: videoUrl,
    );
    if (response is Map) {
      return response['success'] == true ? true : response;
    }
    return false;
  }

  // ================= CHECKINS =================

  Future<Map<String, dynamic>> createCheckIn({
    required Map<String, dynamic> requestBody,
  }) async {
    return appRepo.sendCheckIn(requestBody: requestBody);
  }

  Future<ApiResponse<CheckInsResponseData>> getCheckins({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCheckins(page: page, limit: limit);
  }
}
