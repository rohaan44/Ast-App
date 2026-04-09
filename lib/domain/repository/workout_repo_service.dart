import 'package:ast_official/data/repository/workout_repo.dart';

class WorkoutRepoService {
  final WorkoutRepo workoutRepo;

  WorkoutRepoService({required this.workoutRepo});

  // ================= WORKOUTS =================

  Future<Map<String, dynamic>> getWorkouts(
      {int page = 1, int limit = 20}) async {
    return workoutRepo.getWorkouts(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> createWorkout(
      {required Map<String, dynamic> body}) async {
    return workoutRepo.createWorkout(body: body);
  }

  Future<Map<String, dynamic>> getMyAssignedWorkouts(
      {int page = 1, int limit = 20}) async {
    return workoutRepo.getMyAssignedWorkouts(page: page, limit: limit);
  }

  // ================= ASSIGNMENTS =================

  Future<Map<String, dynamic>> assignWorkout(
      {required Map<String, dynamic> body}) async {
    return workoutRepo.assignWorkout(body: body);
  }

  Future<Map<String, dynamic>> getAssignments(
      {int page = 1, int limit = 20}) async {
    return workoutRepo.getAssignments(page: page, limit: limit);
  }
}
