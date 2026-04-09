import 'package:ast_official/data/repository/academy_repo.dart';

class AcademyRepoService {
  final AcademyRepo academyRepo;

  AcademyRepoService({required this.academyRepo});

  // ================= COURSES =================

  Future<Map<String, dynamic>> getCourses(
      {int page = 1, int limit = 20}) async {
    return academyRepo.getCourses(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> createCourse(
      {required Map<String, dynamic> body}) async {
    return academyRepo.createCourse(body: body);
  }

  Future<Map<String, dynamic>> getMyCreatedCourses(
      {int page = 1, int limit = 20}) async {
    return academyRepo.getMyCreatedCourses(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> enrollInCourse(
      {required String courseId}) async {
    return academyRepo.enrollInCourse(courseId: courseId);
  }

  Future<Map<String, dynamic>> getMyCourses(
      {int page = 1, int limit = 20}) async {
    return academyRepo.getMyCourses(page: page, limit: limit);
  }

  // ================= CERTIFICATIONS =================

  Future<Map<String, dynamic>> getCertifications(
      {int page = 1, int limit = 20}) async {
    return academyRepo.getCertifications(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> applyForCertification(
      {required Map<String, dynamic> body}) async {
    return academyRepo.applyForCertification(body: body);
  }

  Future<Map<String, dynamic>> getMyCertifications(
      {int page = 1, int limit = 20}) async {
    return academyRepo.getMyCertifications(page: page, limit: limit);
  }

  // ================= EXAMS =================

  Future<Map<String, dynamic>> createExam(
      {required Map<String, dynamic> body}) async {
    return academyRepo.createExam(body: body);
  }

  // ================= COURSE CRUD =================

  Future<Map<String, dynamic>> getCourseById({required String id}) async {
    return academyRepo.getCourseById(id: id);
  }

  Future<Map<String, dynamic>> updateCourse(
      {required String id, required Map<String, dynamic> body}) async {
    return academyRepo.updateCourse(id: id, body: body);
  }

  Future<Map<String, dynamic>> deleteCourse({required String id}) async {
    return academyRepo.deleteCourse(id: id);
  }

  Future<Map<String, dynamic>> uploadCourseThumbnail(
      {required String courseId, required String imagePath}) async {
    return academyRepo.uploadCourseThumbnail(
        courseId: courseId, imagePath: imagePath);
  }

  // ================= MODULES =================

  Future<Map<String, dynamic>> addModule({
    required String courseId,
    required String title,
    String? description,
    String? quizLinks,
    List<String>? filePaths,
  }) async {
    return academyRepo.addModule(
      courseId: courseId,
      title: title,
      description: description,
      quizLinks: quizLinks,
      filePaths: filePaths,
    );
  }

  Future<Map<String, dynamic>> updateModule({
    required String courseId,
    required String moduleId,
    required Map<String, dynamic> body,
  }) async {
    return academyRepo.updateModule(
        courseId: courseId, moduleId: moduleId, body: body);
  }

  Future<Map<String, dynamic>> deleteModule(
      {required String courseId, required String moduleId}) async {
    return academyRepo.deleteModule(courseId: courseId, moduleId: moduleId);
  }

  // ================= CERTIFICATION CRUD =================

  Future<Map<String, dynamic>> issueCertification({
    required String id,
    required String expiryDate,
    String? certificateUrl,
  }) async {
    return academyRepo.issueCertification(
        id: id, expiryDate: expiryDate, certificateUrl: certificateUrl);
  }

  Future<Map<String, dynamic>> requestRenewal({required String id}) async {
    return academyRepo.requestRenewal(id: id);
  }

  Future<Map<String, dynamic>> confirmRenewalPayment(
      {required String id, String? paymentId}) async {
    return academyRepo.confirmRenewalPayment(id: id, paymentId: paymentId);
  }

  Future<Map<String, dynamic>> renewCertification({
    required String id,
    required String expiryDate,
    String? notes,
  }) async {
    return academyRepo.renewCertification(
        id: id, expiryDate: expiryDate, notes: notes);
  }

  Future<Map<String, dynamic>> revokeCertification({required String id}) async {
    return academyRepo.revokeCertification(id: id);
  }
}
