import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';

class NotificationRepo {
  static final DioHelper _dioHelper = DioHelper();

  // ================= FCM TOKEN =================

  /// POST /auth/fcm-token
  Future<Map<String, dynamic>> saveFCMToken({required String token}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}auth/fcm-token",
      requestBody: {"token": token},
    );
    return response;
  }

  /// DELETE /auth/fcm-token
  /// Note: DioHelper.delete() has no isAuthRequired — token is passed via headers manually.
  Future<Map<String, dynamic>> removeFCMToken({required String token}) async {
    final authToken = await AuthStorage.getToken();
    final response = await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}auth/fcm-token",
      requestBody: {"token": token},
      headers: authToken != null ? {"Authorization": "Bearer $authToken"} : null,
    );
    return response;
  }

  // ================= NOTIFICATIONS =================

  /// GET /notifications (used by both Athlete and Coach — role filtered by token)
  Future<Map<String, dynamic>> getNotifications(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}notifications",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  /// PUT /notifications/read-all
  Future<Map<String, dynamic>> markAllAsRead() async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}notifications/read-all",
      requestBody: {},
    );
    return response;
  }

  /// DELETE /notifications/clear-read
  Future<Map<String, dynamic>> clearReadNotifications() async {
    final authToken = await AuthStorage.getToken();
    final response = await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}notifications/clear-read",
      headers: authToken != null ? {"Authorization": "Bearer $authToken"} : null,
    );
    return response;
  }

  // ================= EXTENDED NOTIFICATION APIs =================

  /// GET /notifications/unread-count
  Future<Map<String, dynamic>> getUnreadCount() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}notifications/unread-count",
    );
    return response;
  }

  /// PUT /notifications/:id/read
  Future<Map<String, dynamic>> markAsRead({required String id}) async {
    final response = await _dioHelper.put(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}notifications/$id/read",
      requestBody: {},
    );
    return response;
  }

  /// DELETE /notifications/:id
  Future<Map<String, dynamic>> deleteNotification({required String id}) async {
    final authToken = await AuthStorage.getToken();
    final response = await _dioHelper.delete(
      url: "${NetworkProperties.baseUrl}notifications/$id",
      headers: authToken != null ? {"Authorization": "Bearer $authToken"} : null,
    );
    return response;
  }
}
