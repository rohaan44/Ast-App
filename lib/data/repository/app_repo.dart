import 'dart:convert';
import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/app_models/get_daily_nutrition_model.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';
import 'package:ast_official/data/models/app_models/get_role_athelete.dart';
import 'package:dio/dio.dart';

class AppRepo {
  static final DioHelper _dioHelper = DioHelper();

  final String user = "users/search?role=";
  Future<GetMyProfile> getMyProfile() async {
    var response = await _dioHelper.get(
        isAuthRequired: true, url: "${NetworkProperties.baseUrl}users/profile");
    return GetMyProfile.fromJson(response);
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
      url: "${NetworkProperties.baseUrl}users/profile/photo",
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
          "name": name,
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

  Future<Map<String, dynamic>> createCheckin() async {
    var response = await _dioHelper.post(
      isAuthRequired: true, 
      url: "${NetworkProperties.baseUrl}users/checkin");
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
}
