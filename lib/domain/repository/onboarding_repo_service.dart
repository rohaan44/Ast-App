import 'package:ast_official/data/models/get_all_plans_model.dart';
import 'package:ast_official/data/repository/onboarding_repo.dart';

class OnboardingRepoService {
  final OnboardingRepo onboardingRepository;

  OnboardingRepoService({required this.onboardingRepository});
  
  // Future sendDateOfBirth({required String dateOfBirth}) async {
  //   return await onboardingRepository.sendDateOfBirth(dateOfBirth: dateOfBirth);
  // }
  
  
  
  Future <Map<String, dynamic>> sendDateOfBirth({required String dateOfBirth}) async {
    final response = await onboardingRepository.sendDateOfBirth(dateOfBirth: dateOfBirth);
  
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
  }
  Future <Map<String, dynamic>> sendGender({required String gender}) async {
    final response = await onboardingRepository.sendGender(gender: gender);
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
  }
  
  
    Future <Map<String, dynamic>> sendBodyMetrics({required String heightValue, required String heightUnit, required String weightValue, required String weightUnit}) async {
    final response = await onboardingRepository.sendBodyMetrics(heightValue: heightValue, heightUnit: heightUnit, weightValue: weightValue, weightUnit: weightUnit);
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
  }
  
  Future <Map<String, dynamic>> sendFitnessGoal({required List<String> fitnessGoal, required String experienceLevel}) async {
    final response = await onboardingRepository.sendFitnessGoal(fitnessGoal: fitnessGoal, experienceLevel: experienceLevel);
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
  }
  
  Future <Map<String, dynamic>> sendPaymentStripe({required String planId}) async {
    final response = await onboardingRepository.sendPaymentStripe(planId: planId);
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
  }
  
    Future <GetAllPlansModel> getPlans() async {
    final response = await onboardingRepository.getPlans();
      if (response.success == true) {
        return response;
      } else {
        return response;
      }
  }
  
  
  }