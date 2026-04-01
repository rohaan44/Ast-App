import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:dio/dio.dart';

class AcademyRepo {
  static final DioHelper _dioHelper = DioHelper();

  // ================= COURSES =================

  /// GET /academy/courses
  Future<Map<String, dynamic>> getCourses(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  /// POST /academy/courses
  Future<Map<String, dynamic>> createCourse(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses",
      requestBody: body,
    );
    return response;
  }

  /// GET /academy/my-created-courses
  Future<Map<String, dynamic>> getMyCreatedCourses(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/my-created-courses",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  /// POST /academy/enroll
  Future<Map<String, dynamic>> enrollInCourse(
      {required String courseId}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/enroll",
      requestBody: {"courseId": courseId},
    );
    return response;
  }

  /// GET /academy/my-courses
  Future<Map<String, dynamic>> getMyCourses(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/my-courses",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  // ================= CERTIFICATIONS =================

  /// GET /certifications
  Future<Map<String, dynamic>> getCertifications(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  /// POST /certifications/apply
  Future<Map<String, dynamic>> applyForCertification(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/apply",
      requestBody: body,
    );
    return response;
  }

  /// GET /certifications/my-certifications
  Future<Map<String, dynamic>> getMyCertifications(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/my-certifications",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  // ================= EXAMS =================

  /// POST /exams
  Future<Map<String, dynamic>> createExam(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}exams",
      requestBody: body,
    );
    return response;
  }

  // ================= COURSE CRUD =================

  /// GET /academy/courses/:id
  Future<Map<String, dynamic>> getCourseById({required String id}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses/$id",
    );
    return response;
  }

  /// PUT /academy/courses/:id
  Future<Map<String, dynamic>> updateCourse({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses/$id",
      requestBody: body,
    );
    return response;
  }

  /// DELETE /academy/courses/:id
  Future<Map<String, dynamic>> deleteCourse({required String id}) async {
    final authToken = await AuthStorage.getToken();
    final response = await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}academy/courses/$id",
      headers: authToken != null ? {"Authorization": "Bearer $authToken"} : null,
    );
    return response;
  }

  /// POST /academy/courses/:courseId/thumbnail (multipart)
  Future<Map<String, dynamic>> uploadCourseThumbnail({
    required String courseId,
    required String imagePath,
  }) async {
    final formData = FormData.fromMap({
      "thumbnail": await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      ),
    });
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses/$courseId/thumbnail",
      isMultipart: true,
      formData: formData,
    );
    return response;
  }

  // ================= MODULES =================

  /// POST /academy/courses/:courseId/modules (multipart)
  Future<Map<String, dynamic>> addModule({
    required String courseId,
    required String title,
    String? description,
    String? quizLinks,
    List<String>? filePaths,
  }) async {
    final Map<String, dynamic> fields = {
      "title": title,
      if (description != null) "description": description,
      if (quizLinks != null) "quizLinks": quizLinks,
    };
    if (filePaths != null) {
      fields["files"] = await Future.wait(
        filePaths.map((p) => MultipartFile.fromFile(p, filename: p.split('/').last)),
      );
    }
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses/$courseId/modules",
      isMultipart: true,
      formData: FormData.fromMap(fields),
    );
    return response;
  }

  /// PUT /academy/courses/:courseId/modules/:moduleId (multipart)
  Future<Map<String, dynamic>> updateModule({
    required String courseId,
    required String moduleId,
    required Map<String, dynamic> body,
  }) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}academy/courses/$courseId/modules/$moduleId",
      requestBody: body,
    );
    return response;
  }

  /// DELETE /academy/courses/:courseId/modules/:moduleId
  Future<Map<String, dynamic>> deleteModule({
    required String courseId,
    required String moduleId,
  }) async {
    final authToken = await AuthStorage.getToken();
    final response = await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}academy/courses/$courseId/modules/$moduleId",
      headers: authToken != null ? {"Authorization": "Bearer $authToken"} : null,
    );
    return response;
  }

  // ================= CERTIFICATION CRUD =================

  /// POST /certifications/:id/issue
  Future<Map<String, dynamic>> issueCertification({
    required String id,
    required String expiryDate,
    String? certificateUrl,
  }) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/$id/issue",
      requestBody: {
        "expiryDate": expiryDate,
        if (certificateUrl != null) "certificateUrl": certificateUrl,
      },
    );
    return response;
  }

  /// POST /certifications/:id/request-renewal
  Future<Map<String, dynamic>> requestRenewal({required String id}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/$id/request-renewal",
      requestBody: {},
    );
    return response;
  }

  /// POST /certifications/:id/confirm-renewal-payment
  Future<Map<String, dynamic>> confirmRenewalPayment({
    required String id,
    String? paymentId,
  }) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/$id/confirm-renewal-payment",
      requestBody: {
        if (paymentId != null) "paymentId": paymentId,
      },
    );
    return response;
  }

  /// PUT /certifications/:id/renew
  Future<Map<String, dynamic>> renewCertification({
    required String id,
    required String expiryDate,
    String? notes,
  }) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/$id/renew",
      requestBody: {
        "expiryDate": expiryDate,
        if (notes != null) "notes": notes,
      },
    );
    return response;
  }

  /// PUT /certifications/:id/revoke
  Future<Map<String, dynamic>> revokeCertification({required String id}) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}certifications/$id/revoke",
      requestBody: {},
    );
    return response;
  }
}
