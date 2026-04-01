// ============================================================
//  Workout Models
//  Covers: getWorkouts, createWorkout, getMyAssignedWorkouts
//          assignWorkout, getAssignments
// ============================================================

// ─── Shared Pagination ──────────────────────────────────────
class WorkoutPagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  WorkoutPagination({this.page, this.limit, this.total, this.pages});

  WorkoutPagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'limit': limit,
        'total': total,
        'pages': pages,
      };
}

// ─── Workout Item ────────────────────────────────────────────
class WorkoutItem {
  String? sId;
  String? id;
  String? title;
  String? description;
  String? createdBy;
  List<dynamic>? exercises;
  String? createdAt;
  String? updatedAt;

  WorkoutItem({
    this.sId,
    this.id,
    this.title,
    this.description,
    this.createdBy,
    this.exercises,
    this.createdAt,
    this.updatedAt,
  });

  WorkoutItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'] is Map
        ? json['createdBy']['_id'] ?? json['createdBy']['id']
        : json['createdBy'];
    exercises = json['exercises'] as List<dynamic>?;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'title': title,
        'description': description,
        'createdBy': createdBy,
        'exercises': exercises,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

// ─── GET /workouts ───────────────────────────────────────────
class GetWorkoutsResponseModel {
  bool? success;
  String? error;
  GetWorkoutsData? data;

  GetWorkoutsResponseModel({this.success, this.error, this.data});

  GetWorkoutsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? GetWorkoutsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

class GetWorkoutsData {
  List<WorkoutItem>? workouts;
  WorkoutPagination? pagination;

  GetWorkoutsData({this.workouts, this.pagination});

  GetWorkoutsData.fromJson(Map<String, dynamic> json) {
    workouts = (json['workouts'] as List<dynamic>?)
        ?.map((e) => WorkoutItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? WorkoutPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'workouts': workouts?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

// ─── POST /workouts ──────────────────────────────────────────
class CreateWorkoutResponseModel {
  bool? success;
  String? error;
  WorkoutItem? data;

  CreateWorkoutResponseModel({this.success, this.error, this.data});

  CreateWorkoutResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? WorkoutItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /workouts/my-assigned ───────────────────────────────
class GetMyAssignedWorkoutsResponseModel {
  bool? success;
  String? error;
  GetWorkoutsData? data;

  GetMyAssignedWorkoutsResponseModel({this.success, this.error, this.data});

  GetMyAssignedWorkoutsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? GetWorkoutsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── Assignment Item ─────────────────────────────────────────
class AssignmentItem {
  String? sId;
  String? id;
  String? workout;
  String? athlete;
  String? coach;
  String? status;
  String? assignedAt;
  String? dueDate;

  AssignmentItem({
    this.sId,
    this.id,
    this.workout,
    this.athlete,
    this.coach,
    this.status,
    this.assignedAt,
    this.dueDate,
  });

  AssignmentItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    workout = json['workout'] is Map
        ? json['workout']['_id'] ?? json['workout']['id']
        : json['workout'];
    athlete = json['athlete'] is Map
        ? json['athlete']['_id'] ?? json['athlete']['id']
        : json['athlete'];
    coach = json['coach'] is Map
        ? json['coach']['_id'] ?? json['coach']['id']
        : json['coach'];
    status = json['status'];
    assignedAt = json['assignedAt'];
    dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'workout': workout,
        'athlete': athlete,
        'coach': coach,
        'status': status,
        'assignedAt': assignedAt,
        'dueDate': dueDate,
      };
}

// ─── POST /assignments ───────────────────────────────────────
class AssignWorkoutResponseModel {
  bool? success;
  String? error;
  AssignmentItem? data;

  AssignWorkoutResponseModel({this.success, this.error, this.data});

  AssignWorkoutResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data =
        json['data'] != null ? AssignmentItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /assignments ────────────────────────────────────────
class GetAssignmentsData {
  List<AssignmentItem>? assignments;
  WorkoutPagination? pagination;

  GetAssignmentsData({this.assignments, this.pagination});

  GetAssignmentsData.fromJson(Map<String, dynamic> json) {
    assignments = (json['assignments'] as List<dynamic>?)
        ?.map((e) => AssignmentItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? WorkoutPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'assignments': assignments?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

class GetAssignmentsResponseModel {
  bool? success;
  String? error;
  GetAssignmentsData? data;

  GetAssignmentsResponseModel({this.success, this.error, this.data});

  GetAssignmentsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? GetAssignmentsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}
