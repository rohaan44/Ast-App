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

  Future<GetExercisesResponseModel> getAllExercises(
      {int page = 1, int limit = 20}) async {
    return appRepo.getAllExercises(page: page, limit: limit);
  }

  Future<GetRollAthleteResponseModel> getRollAthelet(
      {int page = 1, int limit = 20}) async {
    return appRepo.getRollAthelet(page: page, limit: limit);
  }
}
