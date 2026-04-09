import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';

class ActivityRepo {
  static final DioHelper _dioHelper = DioHelper();

  // ================= ACTIVITY TRACKING =================

  /// GET /activity/today
  Future<Map<String, dynamic>> getTodayActivity() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/today",
    );
    return response;
  }

  /// POST /activity/log
  Future<Map<String, dynamic>> logActivity(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/log",
      requestBody: body,
    );
    return response;
  }

  /// PUT /activity/set
  Future<Map<String, dynamic>> setActivity(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/set",
      requestBody: body,
    );
    return response;
  }

  /// GET /activity/history
  Future<Map<String, dynamic>> getActivityHistory({
    String? startDate,
    String? endDate,
    int limit = 30,
  }) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/history",
      queryParameters: {
        "limit": limit,
        if (startDate != null) "startDate": startDate,
        if (endDate != null) "endDate": endDate,
      },
    );
    return response;
  }

  /// GET /activity/weekly
  Future<Map<String, dynamic>> getWeeklySummary() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/weekly",
    );
    return response;
  }

  /// PUT /activity/goals
  Future<Map<String, dynamic>> updateGoals(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}activity/goals",
      requestBody: body,
    );
    return response;
  }
}
