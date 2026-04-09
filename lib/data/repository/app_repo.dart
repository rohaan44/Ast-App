import 'dart:convert';
import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/app_models/get_daily_nutrition_model.dart';
import 'package:ast_official/data/models/app_models/get_checkins_model.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';
import 'package:ast_official/data/models/app_models/get_role_athelete.dart';
import 'package:ast_official/data/models/base_model/base_model.dart';
import 'package:dio/dio.dart';

class AppRepo {
  static final DioHelper _dioHelper = DioHelper();

  final String user = "users/search?role=";
  Future<GetMyProfile> getMyProfile() async {
    var response = await _dioHelper.get(
        isAuthRequired: true, url: "${NetworkProperties.baseUrl}users/profile");
    return GetMyProfile.fromJson(response);
  }

  Future<Map<String, dynamic>> getCoachProfileById({required String id}) async {
    var response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}users/search",
      queryParameters: {"role": "coach", "id": id},
    );
    return response;
  }

  Future<GetDailyNutrition> getDailyNutrition() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals/nutrition/daily-progress");
    return GetDailyNutrition.fromJson(response);
  }

  Future<Map<String, dynamic>> getMyAssignedMeals() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals/my-assigned");
    return response;
  }

  Future<GetExercisesResponseModel> getAllExercises(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}exercises",
      queryParameters: {"page": page, "limit": limit, "total": 0, "pages": 0},
    );
    return GetExercisesResponseModel.fromJson(response);
  }

  Future<Map<String, dynamic>> updateProfilePicture(
      {required String imagePath}) async {
    var response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}users/avatar",
      isMultipart: true,
      formData: FormData.fromMap({
        "photo": await MultipartFile.fromFile(imagePath),
      }),
    );
    if (response is String) {
      return jsonDecode(response);
    }
    return response as Map<String, dynamic>;
  }

  Future<GetMyProfile> updateProfile(
      {required String name,
      required String email,
      required String phone,
      required String bio,
      required List<String> fitnessGoals}) async {
    var response = await _dioHelper.put(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/profile",
        requestBody: {
          "fullName": name,
          "email": email,
          "phone": phone,
          "bio": bio,
          "fitnessGoals": fitnessGoals,
        });
    return GetMyProfile.fromJson(response);
  }

  Future<Map<String, dynamic>> getCoaches(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}users/search");
    return response;
  }

  Future<Map<String, dynamic>> sendCoachRequest(
      {required String coachId}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        requestBody: {"coachId": coachId},
        url: "${NetworkProperties.baseUrl}relationships/request");
    return response;
  }

  Future<Map<String, dynamic>> getMyCoaches() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}relationships/my-coaches");
    return response;
  }
//   Coach Flow ...

// training plan ...
  Future createExcercise(
      {required String name,
      required String category,
      required String muscleGroup,
      required String description,
      required String videoUrl}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}exercises", // Bug fix: was 'exercise' (missing 's')
        requestBody: {
          "name": name,
          "category": category,
          "muscleGroup": muscleGroup,
          "description": description,
          "videoUrl": videoUrl,
        });
    return response;
  }

// athelet management

  Future<Map<String, dynamic>> getAllMyAtheletes(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}relationships/my-athletes");
    return response;
  }

  Future<Map<String, dynamic>> getAtheletPendingRequest(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}relationships/my-athletes");
    return response;
  }

  Future acceptReqAthelet({required String relationshipId}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}relationships/accept/$relationshipId",
        requestBody: {});
    return response;
  }

  Future rejectReqAthelet({required String relationshipId}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}relationships/reject/$relationshipId",
        requestBody: {});
    return response;
  }

  Future<Map<String, dynamic>> endRelationship(
      {required String relationshipId}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}relationships/$relationshipId/end",
        requestBody: {});
    return response;
  }

  Future<Map<String, dynamic>> assignWorkoutToRelationship({
    required String relationshipId,
    required String workoutId,
    String? startDate,
    String? endDate,
    String? notes,
  }) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url:
            "${NetworkProperties.baseUrl}relationships/$relationshipId/assign-workout",
        requestBody: {
          "workoutId": workoutId,
          if (startDate != null) "startDate": startDate,
          if (endDate != null) "endDate": endDate,
          if (notes != null) "notes": notes,
        });
    return response;
  }

  Future<Map<String, dynamic>> getCoachProfile() async {
    var response = await _dioHelper.get(
        isAuthRequired: true, url: "${NetworkProperties.baseUrl}users/profile");
    return response;
  }

// coach home screen

  Future<Map<String, dynamic>> getCoahNotifications(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}notifications");
    return response;
  }

  Future<Map<String, dynamic>> getCoahRelationshipAthelet(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}relationships/my-athletes"); // Bug fix: was '/relationships/athletes'
    return response;
  }

  Future<Map<String, dynamic>> getCoahCheckins(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}checkins");
    return response;
  }

  Future<Map<String, dynamic>> getCoahWorkoutsMyCreated(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"role": "coach", "page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}workouts/my-created");
    return response;
  }

  //  cochessss end here..

  // ================= RELATIONSHIPS =================

  Future<Map<String, dynamic>> getMyRelationships(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}relationships");
    return response;
  }

  Future<Map<String, dynamic>> getRelationshipAssignedWorkouts(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}relationships/assigned-workouts");
    return response;
  }

  // ================= MEAL PLAN =================

  Future<Map<String, dynamic>> createMealPlan(
      {required Map<String, dynamic> body}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals",
        requestBody: body);
    return response;
  }

  // ================= PROGRESS =================

  Future<Map<String, dynamic>> logProgress(
      {required Map<String, dynamic> body}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}progress",
        requestBody: body);
    return response;
  }

  Future<Map<String, dynamic>> getProgress(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}progress");
    return response;
  }

  Future<Map<String, dynamic>> getProgressStats() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}progress/stats");
    return response;
  }


  Future<Map<String, dynamic>> sendCheckIn(
      {required Map<String, dynamic> requestBody}) async {
    var response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}checkins",
      formData: FormData.fromMap(requestBody),
    );
    return response;
  }

  Future<Map<String, dynamic>> createCheckin() async {
    var response = await _dioHelper.post(
        isAuthRequired: true, url: "${NetworkProperties.baseUrl}users/checkin");
    return response;
  }

  Future<GetRollAthleteResponseModel> getRoleAthlete(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}${user}coach",
      queryParameters: {"page": page, "limit": limit, "total": 0, "pages": 0},
    );
    return GetRollAthleteResponseModel.fromJson(response);
  }

  Future<ApiResponse<CheckInsResponseData>> getCheckins(
      {int page = 1, int limit = 20}) async {
    try {
      final res = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}checkins",
        queryParameters: {"page": page, "limit": limit, "total": 0, "pages": 0},
      );
      // ignore: avoid_print
      print("Raw Checkins Data: $res");
      return ApiResponse<CheckInsResponseData>.fromJson(
        res,
        (data) => CheckInsResponseData.fromJson(data),
      );
    } catch (e) {
      return ApiResponse<CheckInsResponseData>.failure(
        e.toString(),
      );
    }
  }

  // ================= USER =================

  Future<Map<String, dynamic>> getUserById({required String id}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/$id");
    return response;
  }

  // ================= EXERCISE (CRUD) =================

  Future<Map<String, dynamic>> getExerciseById({required String id}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}exercises/$id");
    return response;
  }

  Future<Map<String, dynamic>> updateExercise({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dioHelper.put(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}exercises/$id",
        requestBody: body);
    return response;
  }

  Future<Map<String, dynamic>> deleteExercise({required String id}) async {
    final authToken = await AuthStorage.getToken();
    var response = await _dioHelper.delete(
        url: "${NetworkProperties.baseUrl}exercises/$id",
        headers: authToken != null ? {"Authorization": "Bearer \$authToken"} : null);
    return response;
  }

  // ================= CHECK-IN (CRUD) =================

  Future<Map<String, dynamic>> getCheckInById({required String id}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}checkins/$id");
    return response;
  }

  Future<Map<String, dynamic>> updateCheckIn({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dioHelper.put(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}checkins/$id",
        requestBody: body);
    return response;
  }

  Future<Map<String, dynamic>> deleteCheckIn({required String id}) async {
    final authToken = await AuthStorage.getToken();
    var response = await _dioHelper.delete(
        url: "${NetworkProperties.baseUrl}checkins/$id",
        headers: authToken != null ? {"Authorization": "Bearer \$authToken"} : null);
    return response;
  }

  // ================= WORKOUT (CRUD) =================

  Future<Map<String, dynamic>> getWorkoutById({required String id}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}workouts/$id");
    return response;
  }

  Future<Map<String, dynamic>> updateWorkout({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dioHelper.put(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}workouts/$id",
        requestBody: body);
    return response;
  }

  Future<Map<String, dynamic>> deleteWorkout({required String id}) async {
    final authToken = await AuthStorage.getToken();
    var response = await _dioHelper.delete(
        url: "${NetworkProperties.baseUrl}workouts/$id",
        headers: authToken != null ? {"Authorization": "Bearer \$authToken"} : null);
    return response;
  }

  Future<Map<String, dynamic>> startWorkout({required String id}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}workouts/$id/start",
        requestBody: {});
    return response;
  }

  Future<Map<String, dynamic>> completeWorkout({required String id}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}workouts/$id/complete",
        requestBody: {});
    return response;
  }

  // ================= MEAL PLAN (FULL CRUD) =================

  Future<Map<String, dynamic>> getMealPlans(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}meals");
    return response;
  }

  Future<Map<String, dynamic>> getMealPlanById({required String id}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals/$id");
    return response;
  }

  Future<Map<String, dynamic>> updateMealPlan({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dioHelper.put(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals/$id",
        requestBody: body);
    return response;
  }

  Future<Map<String, dynamic>> deleteMealPlan({required String id}) async {
    final authToken = await AuthStorage.getToken();
    var response = await _dioHelper.delete(
        url: "${NetworkProperties.baseUrl}meals/$id",
        headers: authToken != null ? {"Authorization": "Bearer \$authToken"} : null);
    return response;
  }

  Future<Map<String, dynamic>> assignMealPlan({
    required String mealPlanId,
    required String athleteId,
  }) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}meals/$mealPlanId/assign",
        requestBody: {"athleteId": athleteId});
    return response;
  }

  Future<Map<String, dynamic>> getMyAssignedMealPlans(
      {int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        queryParameters: {"page": page, "limit": limit},
        url: "${NetworkProperties.baseUrl}meals/my-assigned");
    return response;
  }

  // ================= PROGRESS (EXTENDED) =================

  Future<Map<String, dynamic>> getAthleteProgress(
      {required String athleteId}) async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}progress/athlete/$athleteId");
    return response;
  }

  Future<Map<String, dynamic>> getWeeklyProgress() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}progress/weekly");
    return response;
  }

  // ================= SUBSCRIPTION (EXTENDED) =================

  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}subscriptions/status");
    return response;
  }
}
