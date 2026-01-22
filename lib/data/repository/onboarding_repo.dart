import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/get_all_plans_model.dart';

class OnboardingRepo {
  static final DioHelper _dioHelper = DioHelper();

  Future<Map<String, dynamic>> sendDateOfBirth(
      {required String dateOfBirth}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/onboarding/dob",
        requestBody: {"dateOfBirth": dateOfBirth});
    return response;
  }

  Future<Map<String, dynamic>> sendGender({required String gender}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/onboarding/gender",
        requestBody: {"gender": gender});
    return response;
  }

  Future<Map<String, dynamic>> sendBodyMetrics(
      {required String heightValue,
      required String heightUnit,
      required String weightValue,
      required String weightUnit}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/onboarding/body-metrics",
        requestBody: {
          "height": {"value": heightValue, "unit": heightUnit},
          "weight": {"value": weightValue, "unit": weightUnit}
        });
    return response;
  }

  Future<Map<String, dynamic>> sendFitnessGoal(
      {required List<String> fitnessGoal,
      required String experienceLevel}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}users/onboarding/fitness-goals",
        requestBody: {
          "fitnessGoal": fitnessGoal,
          "experienceLevel": experienceLevel
        });
    return response;
  }

  Future<GetAllPlansModel> getPlans() async {
    var response = await _dioHelper.get(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}plans?type=subscription");
    return GetAllPlansModel.fromJson(response);
  }

  Future<Map<String, dynamic>> sendPaymentStripe(
      {required String planId}) async {
    var response = await _dioHelper.post(
        isAuthRequired: true,
        url: "${NetworkProperties.baseUrl}payments/create-intent",
        requestBody: {"planId": planId});
    return response;
  }
}
