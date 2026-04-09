import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';

class WorkoutRepo {
  static final DioHelper _dioHelper = DioHelper();

  // ================= WORKOUTS =================

  /// GET /workouts
  Future<Map<String, dynamic>> getWorkouts(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}workouts",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  /// POST /workouts
  Future<Map<String, dynamic>> createWorkout(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}workouts",
      requestBody: body,
    );
    return response;
  }

  /// GET /workouts/my-assigned
  Future<Map<String, dynamic>> getMyAssignedWorkouts(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}workouts/my-assigned",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  // ================= ASSIGNMENTS =================

  /// POST /assignments
  Future<Map<String, dynamic>> assignWorkout(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}assignments",
      requestBody: body,
    );
    return response;
  }

  /// GET /assignments
  Future<Map<String, dynamic>> getAssignments(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}assignments",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }
}
