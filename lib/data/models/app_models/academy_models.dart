// ============================================================
//  Academy Models
//  Covers: getCourses, createCourse, getMyCreatedCourses,
//          enrollInCourse, getMyCourses, getCertifications,
//          applyForCertification, getMyCertifications, createExam
// ============================================================

// ─── Shared Pagination ──────────────────────────────────────
class AcademyPagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  AcademyPagination({this.page, this.limit, this.total, this.pages});

  AcademyPagination.fromJson(Map<String, dynamic> json) {
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

// ─── Course Item ─────────────────────────────────────────────
class CourseItem {
  String? sId;
  String? id;
  String? title;
  String? description;
  String? createdBy;
  String? category;
  String? level;
  String? thumbnail;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;

  CourseItem({
    this.sId,
    this.id,
    this.title,
    this.description,
    this.createdBy,
    this.category,
    this.level,
    this.thumbnail,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
  });

  CourseItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'] is Map
        ? json['createdBy']['_id'] ?? json['createdBy']['id']
        : json['createdBy'];
    category = json['category'];
    level = json['level'];
    thumbnail = json['thumbnail'];
    isPublished = json['isPublished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'title': title,
        'description': description,
        'createdBy': createdBy,
        'category': category,
        'level': level,
        'thumbnail': thumbnail,
        'isPublished': isPublished,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

// ─── GET /academy/courses ────────────────────────────────────
class CoursesListData {
  List<CourseItem>? courses;
  AcademyPagination? pagination;

  CoursesListData({this.courses, this.pagination});

  CoursesListData.fromJson(Map<String, dynamic> json) {
    courses = (json['courses'] as List<dynamic>?)
        ?.map((e) => CourseItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? AcademyPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'courses': courses?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

class GetCoursesResponseModel {
  bool? success;
  String? error;
  CoursesListData? data;

  GetCoursesResponseModel({this.success, this.error, this.data});

  GetCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data =
        json['data'] != null ? CoursesListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /academy/courses ───────────────────────────────────
class CreateCourseResponseModel {
  bool? success;
  String? error;
  CourseItem? data;

  CreateCourseResponseModel({this.success, this.error, this.data});

  CreateCourseResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? CourseItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /academy/my-created-courses ─────────────────────────
class GetMyCreatedCoursesResponseModel {
  bool? success;
  String? error;
  CoursesListData? data;

  GetMyCreatedCoursesResponseModel({this.success, this.error, this.data});

  GetMyCreatedCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data =
        json['data'] != null ? CoursesListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /academy/enroll ────────────────────────────────────
class EnrollInCourseResponseModel {
  bool? success;
  String? error;
  Map<String, dynamic>? data;

  EnrollInCourseResponseModel({this.success, this.error, this.data});

  EnrollInCourseResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] is Map<String, dynamic> ? json['data'] : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data,
      };
}

// ─── GET /academy/my-courses ─────────────────────────────────
class GetMyCoursesResponseModel {
  bool? success;
  String? error;
  CoursesListData? data;

  GetMyCoursesResponseModel({this.success, this.error, this.data});

  GetMyCoursesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data =
        json['data'] != null ? CoursesListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── Certification Item ──────────────────────────────────────
class CertificationItem {
  String? sId;
  String? id;
  String? title;
  String? description;
  String? issuedBy;
  String? status;
  String? issuedAt;
  String? expiresAt;

  CertificationItem({
    this.sId,
    this.id,
    this.title,
    this.description,
    this.issuedBy,
    this.status,
    this.issuedAt,
    this.expiresAt,
  });

  CertificationItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    issuedBy = json['issuedBy'] is Map
        ? json['issuedBy']['_id'] ?? json['issuedBy']['id']
        : json['issuedBy'];
    status = json['status'];
    issuedAt = json['issuedAt'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'title': title,
        'description': description,
        'issuedBy': issuedBy,
        'status': status,
        'issuedAt': issuedAt,
        'expiresAt': expiresAt,
      };
}

// ─── GET /certifications ─────────────────────────────────────
class CertificationsListData {
  List<CertificationItem>? certifications;
  AcademyPagination? pagination;

  CertificationsListData({this.certifications, this.pagination});

  CertificationsListData.fromJson(Map<String, dynamic> json) {
    certifications = (json['certifications'] as List<dynamic>?)
        ?.map((e) => CertificationItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? AcademyPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'certifications': certifications?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

class GetCertificationsResponseModel {
  bool? success;
  String? error;
  CertificationsListData? data;

  GetCertificationsResponseModel({this.success, this.error, this.data});

  GetCertificationsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? CertificationsListData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /certifications/apply ──────────────────────────────
class ApplyForCertificationResponseModel {
  bool? success;
  String? error;
  Map<String, dynamic>? data;

  ApplyForCertificationResponseModel({this.success, this.error, this.data});

  ApplyForCertificationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] is Map<String, dynamic> ? json['data'] : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data,
      };
}

// ─── GET /certifications/my-certifications ───────────────────
class GetMyCertificationsResponseModel {
  bool? success;
  String? error;
  CertificationsListData? data;

  GetMyCertificationsResponseModel({this.success, this.error, this.data});

  GetMyCertificationsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? CertificationsListData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /exams ─────────────────────────────────────────────
class CreateExamResponseModel {
  bool? success;
  String? error;
  Map<String, dynamic>? data;

  CreateExamResponseModel({this.success, this.error, this.data});

  CreateExamResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] is Map<String, dynamic> ? json['data'] : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data,
      };
}
