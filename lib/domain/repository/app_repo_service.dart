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


  Future<Map<String, dynamic>> getMyCoaches() async {
    return appRepo.getMyCoaches();
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

  Future<dynamic> acceptReqAthelet({required String relationshipId}) async {
    final response =
        await appRepo.acceptReqAthelet(relationshipId: relationshipId);
    if (response is Map) {
      return response['success'] == true ? true : response;
    }
    return false;
  }

  Future<dynamic> rejectReqAthelet({required String relationshipId}) async {
    final response =
        await appRepo.rejectReqAthelet(relationshipId: relationshipId);
    if (response is Map) {
      return response['success'] == true ? true : response;
    }
    return false;
  }

  Future<Map<String, dynamic>> endRelationship(
      {required String relationshipId}) async {
    return appRepo.endRelationship(relationshipId: relationshipId);
  }

  Future<Map<String, dynamic>> assignWorkoutToRelationship({
    required String relationshipId,
    required String workoutId,
    String? startDate,
    String? endDate,
    String? notes,
  }) async {
    return appRepo.assignWorkoutToRelationship(
      relationshipId: relationshipId,
      workoutId: workoutId,
      startDate: startDate,
      endDate: endDate,
      notes: notes,
    );
  }
  Future<Map<String, dynamic>> getCoachProfile() async {
    return appRepo.getCoachProfile();
  }
//  coach home screen
  Future<Map<String, dynamic>> getCoachNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCoahNotifications(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getCoahRelationshipAthelet({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCoahRelationshipAthelet(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getCoahCheckins({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCoahCheckins(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getCoahWorkoutsMyCreated({
    int page = 1,
    int limit = 20,
  }) async {
    return appRepo.getCoahWorkoutsMyCreated(page: page, limit: limit);
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

  // ================= RELATIONSHIPS (NEW) =================

  Future<Map<String, dynamic>> getMyRelationships(
      {int page = 1, int limit = 20}) async {
    return appRepo.getMyRelationships(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getRelationshipAssignedWorkouts(
      {int page = 1, int limit = 20}) async {
    return appRepo.getRelationshipAssignedWorkouts(page: page, limit: limit);
  }

  // ================= MEAL PLAN (NEW) =================

  Future<Map<String, dynamic>> createMealPlan(
      {required Map<String, dynamic> body}) async {
    return appRepo.createMealPlan(body: body);
  }

  // ================= PROGRESS (NEW) =================

  Future<Map<String, dynamic>> logProgress(
      {required Map<String, dynamic> body}) async {
    return appRepo.logProgress(body: body);
  }

  Future<Map<String, dynamic>> getProgress(
      {int page = 1, int limit = 20}) async {
    return appRepo.getProgress(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getProgressStats() async {
    return appRepo.getProgressStats();
  }

  // ================= USER =================

  Future<Map<String, dynamic>> getUserById({required String id}) async {
    return appRepo.getUserById(id: id);
  }

  // ================= EXERCISE (CRUD) =================

  Future<Map<String, dynamic>> getExerciseById({required String id}) async {
    return appRepo.getExerciseById(id: id);
  }

  Future<Map<String, dynamic>> updateExercise(
      {required String id, required Map<String, dynamic> body}) async {
    return appRepo.updateExercise(id: id, body: body);
  }

  Future<Map<String, dynamic>> deleteExercise({required String id}) async {
    return appRepo.deleteExercise(id: id);
  }

  // ================= CHECK-IN (CRUD) =================

  Future<Map<String, dynamic>> getCheckInById({required String id}) async {
    return appRepo.getCheckInById(id: id);
  }

  Future<Map<String, dynamic>> updateCheckIn(
      {required String id, required Map<String, dynamic> body}) async {
    return appRepo.updateCheckIn(id: id, body: body);
  }

  Future<Map<String, dynamic>> deleteCheckIn({required String id}) async {
    return appRepo.deleteCheckIn(id: id);
  }

  // ================= WORKOUT (CRUD) =================

  Future<Map<String, dynamic>> getWorkoutById({required String id}) async {
    return appRepo.getWorkoutById(id: id);
  }

  Future<Map<String, dynamic>> updateWorkout(
      {required String id, required Map<String, dynamic> body}) async {
    return appRepo.updateWorkout(id: id, body: body);
  }

  Future<Map<String, dynamic>> deleteWorkout({required String id}) async {
    return appRepo.deleteWorkout(id: id);
  }

  Future<Map<String, dynamic>> startWorkout({required String id}) async {
    return appRepo.startWorkout(id: id);
  }

  Future<Map<String, dynamic>> completeWorkout({required String id}) async {
    return appRepo.completeWorkout(id: id);
  }

  // ================= MEAL PLAN (FULL CRUD) =================

  Future<Map<String, dynamic>> getMealPlans(
      {int page = 1, int limit = 20}) async {
    return appRepo.getMealPlans(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> getMealPlanById({required String id}) async {
    return appRepo.getMealPlanById(id: id);
  }

  Future<Map<String, dynamic>> updateMealPlan(
      {required String id, required Map<String, dynamic> body}) async {
    return appRepo.updateMealPlan(id: id, body: body);
  }

  Future<Map<String, dynamic>> deleteMealPlan({required String id}) async {
    return appRepo.deleteMealPlan(id: id);
  }

  Future<Map<String, dynamic>> assignMealPlan(
      {required String mealPlanId, required String athleteId}) async {
    return appRepo.assignMealPlan(
        mealPlanId: mealPlanId, athleteId: athleteId);
  }

  Future<Map<String, dynamic>> getMyAssignedMealPlans(
      {int page = 1, int limit = 20}) async {
    return appRepo.getMyAssignedMealPlans(page: page, limit: limit);
  }

  // ================= PROGRESS (EXTENDED) =================

  Future<Map<String, dynamic>> getAthleteProgress(
      {required String athleteId}) async {
    return appRepo.getAthleteProgress(athleteId: athleteId);
  }

  Future<Map<String, dynamic>> getWeeklyProgress() async {
    return appRepo.getWeeklyProgress();
  }

  // ================= SUBSCRIPTION (EXTENDED) =================

  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    return appRepo.getSubscriptionStatus();
  }
}

