// ============================================================
//  Notification Models
//  Covers: saveFCMToken, removeFCMToken, getNotifications,
//          markAllAsRead, clearReadNotifications
// ============================================================

// ─── Notification Item ───────────────────────────────────────
class NotificationItem {
  String? sId;
  String? id;
  String? title;
  String? body;
  String? type;
  bool? isRead;
  String? createdAt;
  String? userId;

  NotificationItem({
    this.sId,
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.createdAt,
    this.userId,
  });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    body = json['body'] ?? json['message'];
    type = json['type'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    userId = json['userId'] is Map
        ? json['userId']['_id'] ?? json['userId']['id']
        : json['userId'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'title': title,
        'body': body,
        'type': type,
        'isRead': isRead,
        'createdAt': createdAt,
        'userId': userId,
      };
}

// ─── Notification Pagination ─────────────────────────────────
class NotificationPagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  NotificationPagination({this.page, this.limit, this.total, this.pages});

  NotificationPagination.fromJson(Map<String, dynamic> json) {
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

// ─── GET /notifications ──────────────────────────────────────
class NotificationsListData {
  List<NotificationItem>? notifications;
  NotificationPagination? pagination;

  NotificationsListData({this.notifications, this.pagination});

  NotificationsListData.fromJson(Map<String, dynamic> json) {
    notifications = (json['notifications'] as List<dynamic>?)
        ?.map((e) => NotificationItem.fromJson(e))
        .toList();
    pagination = json['pagination'] != null
        ? NotificationPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'notifications': notifications?.map((e) => e.toJson()).toList(),
        if (pagination != null) 'pagination': pagination!.toJson(),
      };
}

class GetNotificationsResponseModel {
  bool? success;
  String? error;
  NotificationsListData? data;

  GetNotificationsResponseModel({this.success, this.error, this.data});

  GetNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? NotificationsListData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /auth/fcm-token ────────────────────────────────────
class SaveFCMTokenResponseModel {
  bool? success;
  String? error;
  String? message;

  SaveFCMTokenResponseModel({this.success, this.error, this.message});

  SaveFCMTokenResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
      };
}

// ─── DELETE /auth/fcm-token ──────────────────────────────────
class RemoveFCMTokenResponseModel {
  bool? success;
  String? error;
  String? message;

  RemoveFCMTokenResponseModel({this.success, this.error, this.message});

  RemoveFCMTokenResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
      };
}

// ─── PUT /notifications/read-all ─────────────────────────────
class MarkAllAsReadResponseModel {
  bool? success;
  String? error;
  String? message;

  MarkAllAsReadResponseModel({this.success, this.error, this.message});

  MarkAllAsReadResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
      };
}

// ─── DELETE /notifications/clear-read ───────────────────────
class ClearReadNotificationsResponseModel {
  bool? success;
  String? error;
  String? message;

  ClearReadNotificationsResponseModel({this.success, this.error, this.message});

  ClearReadNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
      };
}
