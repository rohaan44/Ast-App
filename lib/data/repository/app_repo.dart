import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/app_models/get_exercises_response_model.dart';
import 'package:ast_official/data/models/app_models/get_profile_model.dart';

class AppRepo {
  static final DioHelper _dioHelper = DioHelper();

  Future<GetMyProfile> getMyProfile() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}/users/profile");
    return GetMyProfile.fromJson(response);
  }
  Future<GetExercisesResponseModel> getAllExercises({int page = 1, int limit = 20}) async {
    var response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}/exercises",
      queryParameters: {
        "page": page,
        "limit": limit,
        "total": 0,
        "pages": 0
      },
    );
    return GetExercisesResponseModel.fromJson(response);
  }
}
