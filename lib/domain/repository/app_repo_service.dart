import 'package:ast_official/data/models/app_models/get_daily_nutrition_model.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';
import 'package:ast_official/data/models/app_models/get_role_athelete.dart';
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

  Future<GetRollAthleteResponseModel> getRoleAthlete(
      {int page = 1, int limit = 20}) async {
    return appRepo.getRoleAthlete(page: page, limit: limit);
  }
}
