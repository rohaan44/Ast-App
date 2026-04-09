import 'package:ast_official/data/repository/notification_repo.dart';

class NotificationRepoService {
  final NotificationRepo notificationRepo;

  NotificationRepoService({required this.notificationRepo});

  // ================= FCM TOKEN =================

  Future<Map<String, dynamic>> saveFCMToken({required String token}) async {
    return notificationRepo.saveFCMToken(token: token);
  }

  Future<Map<String, dynamic>> removeFCMToken({required String token}) async {
    return notificationRepo.removeFCMToken(token: token);
  }

  // ================= NOTIFICATIONS =================

  Future<Map<String, dynamic>> getNotifications(
      {int page = 1, int limit = 20}) async {
    return notificationRepo.getNotifications(page: page, limit: limit);
  }

  Future<Map<String, dynamic>> markAllAsRead() async {
    return notificationRepo.markAllAsRead();
  }

  Future<Map<String, dynamic>> clearReadNotifications() async {
    return notificationRepo.clearReadNotifications();
  }

  // ================= EXTENDED =================

  Future<Map<String, dynamic>> getUnreadCount() async {
    return notificationRepo.getUnreadCount();
  }

  Future<Map<String, dynamic>> markAsRead({required String id}) async {
    return notificationRepo.markAsRead(id: id);
  }

  Future<Map<String, dynamic>> deleteNotification({required String id}) async {
    return notificationRepo.deleteNotification(id: id);
  }
}
