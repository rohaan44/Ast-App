import 'package:ast_official/data/repository/activity_repo.dart';

class ActivityRepoService {
  final ActivityRepo activityRepo;

  ActivityRepoService({required this.activityRepo});

  // ================= ACTIVITY TRACKING =================

  Future<Map<String, dynamic>> getTodayActivity() async {
    return activityRepo.getTodayActivity();
  }

  Future<Map<String, dynamic>> logActivity(
      {required Map<String, dynamic> body}) async {
    return activityRepo.logActivity(body: body);
  }

  Future<Map<String, dynamic>> setActivity(
      {required Map<String, dynamic> body}) async {
    return activityRepo.setActivity(body: body);
  }

  Future<Map<String, dynamic>> getActivityHistory({
    String? startDate,
    String? endDate,
    int limit = 30,
  }) async {
    return activityRepo.getActivityHistory(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );
  }

  Future<Map<String, dynamic>> getWeeklySummary() async {
    return activityRepo.getWeeklySummary();
  }

  Future<Map<String, dynamic>> updateGoals(
      {required Map<String, dynamic> body}) async {
    return activityRepo.updateGoals(body: body);
  }
}
