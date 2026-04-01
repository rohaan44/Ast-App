// ============================================================
//  Progress & Meal Plan Models
//  Covers: logProgress, getProgress, getProgressStats,
//          createMealPlan
// ============================================================

// ─── Progress Item ───────────────────────────────────────────
class ProgressItem {
  String? sId;
  String? id;
  String? userId;
  String? type;
  num? value;
  String? unit;
  String? notes;
  String? date;
  String? createdAt;

  ProgressItem({
    this.sId,
    this.id,
    this.userId,
    this.type,
    this.value,
    this.unit,
    this.notes,
    this.date,
    this.createdAt,
  });

  ProgressItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    userId = json['userId'] is Map
        ? json['userId']['_id'] ?? json['userId']['id']
        : json['userId'];
    type = json['type'];
    value = json['value'];
    unit = json['unit'];
    notes = json['notes'];
    date = json['date'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'userId': userId,
        'type': type,
        'value': value,
        'unit': unit,
        'notes': notes,
        'date': date,
        'createdAt': createdAt,
      };
}

// ─── Progress Pagination ─────────────────────────────────────
class ProgressPagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  ProgressPagination({this.page, this.limit, this.total, this.pages});

  ProgressPagination.fromJson(Map<String, dynamic> json) {
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

// ─── POST /progress ──────────────────────────────────────────
class LogProgressResponseModel {
  bool? success;
  String? error;
  ProgressItem? data;

  LogProgressResponseModel({this.success, this.error, this.data});

  LogProgressResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? ProgressItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /progress ───────────────────────────────────────────
class ProgressListData {
  List<ProgressItem>? progress;
  ProgressPagination? pagination;

  ProgressListData({this.progress, this.pagination});

  ProgressListData.fromJson(Map<String, dynamic> json) {
    progress = (json['progress'] as List<dynamic>?)
        ?.map((e) => ProgressItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? ProgressPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'progress': progress?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

class GetProgressResponseModel {
  bool? success;
  String? error;
  ProgressListData? data;

  GetProgressResponseModel({this.success, this.error, this.data});

  GetProgressResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data =
        json['data'] != null ? ProgressListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /progress/stats ─────────────────────────────────────
class ProgressStatsData {
  num? totalEntries;
  num? averageValue;
  Map<String, dynamic>? breakdown;

  ProgressStatsData({this.totalEntries, this.averageValue, this.breakdown});

  ProgressStatsData.fromJson(Map<String, dynamic> json) {
    totalEntries = json['totalEntries'];
    averageValue = json['averageValue'];
    breakdown =
        json['breakdown'] is Map<String, dynamic> ? json['breakdown'] : null;
  }

  Map<String, dynamic> toJson() => {
        'totalEntries': totalEntries,
        'averageValue': averageValue,
        if (breakdown != null) 'breakdown': breakdown,
      };
}

class GetProgressStatsResponseModel {
  bool? success;
  String? error;
  ProgressStatsData? data;

  GetProgressStatsResponseModel({this.success, this.error, this.data});

  GetProgressStatsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? ProgressStatsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /meals ─────────────────────────────────────────────
class MealPlanItem {
  String? sId;
  String? id;
  String? name;
  String? description;
  String? createdBy;
  List<dynamic>? meals;
  String? createdAt;

  MealPlanItem({
    this.sId,
    this.id,
    this.name,
    this.description,
    this.createdBy,
    this.meals,
    this.createdAt,
  });

  MealPlanItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdBy = json['createdBy'] is Map
        ? json['createdBy']['_id'] ?? json['createdBy']['id']
        : json['createdBy'];
    meals = json['meals'] as List<dynamic>?;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'name': name,
        'description': description,
        'createdBy': createdBy,
        'meals': meals,
        'createdAt': createdAt,
      };
}

class CreateMealPlanResponseModel {
  bool? success;
  String? error;
  MealPlanItem? data;

  CreateMealPlanResponseModel({this.success, this.error, this.data});

  CreateMealPlanResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? MealPlanItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}
