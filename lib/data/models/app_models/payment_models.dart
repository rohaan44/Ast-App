// ============================================================
//  Payment & Subscription Models
//  Covers: createPaymentIntent, confirmPayment,
//          createPayPalPayment, executePayPalPayment,
//          getPaymentHistory, createPlan,
//          createSubscription, getMySubscription,
//          renewSubscription, cancelSubscription, getRenewalInfo
// ============================================================

// ─── POST /payments/create-intent ───────────────────────────
class CreatePaymentIntentData {
  String? clientSecret;
  String? paymentIntentId;

  CreatePaymentIntentData({this.clientSecret, this.paymentIntentId});

  CreatePaymentIntentData.fromJson(Map<String, dynamic> json) {
    clientSecret = json['clientSecret'];
    paymentIntentId = json['paymentIntentId'];
  }

  Map<String, dynamic> toJson() => {
        'clientSecret': clientSecret,
        'paymentIntentId': paymentIntentId,
      };
}

class CreatePaymentIntentResponseModel {
  bool? success;
  String? error;
  CreatePaymentIntentData? data;

  CreatePaymentIntentResponseModel({this.success, this.error, this.data});

  CreatePaymentIntentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? CreatePaymentIntentData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /payments/confirm ──────────────────────────────────
class ConfirmPaymentResponseModel {
  bool? success;
  String? error;
  String? message;
  Map<String, dynamic>? data;

  ConfirmPaymentResponseModel({this.success, this.error, this.message, this.data});

  ConfirmPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] is Map<String, dynamic> ? json['data'] : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
        if (data != null) 'data': data,
      };
}

// ─── POST /payments/paypal/create ───────────────────────────
class CreatePayPalPaymentData {
  String? approvalUrl;
  String? paymentId;

  CreatePayPalPaymentData({this.approvalUrl, this.paymentId});

  CreatePayPalPaymentData.fromJson(Map<String, dynamic> json) {
    approvalUrl = json['approvalUrl'];
    paymentId = json['paymentId'];
  }

  Map<String, dynamic> toJson() => {
        'approvalUrl': approvalUrl,
        'paymentId': paymentId,
      };
}

class CreatePayPalPaymentResponseModel {
  bool? success;
  String? error;
  CreatePayPalPaymentData? data;

  CreatePayPalPaymentResponseModel({this.success, this.error, this.data});

  CreatePayPalPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? CreatePayPalPaymentData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /payments/paypal/execute ──────────────────────────
class ExecutePayPalPaymentResponseModel {
  bool? success;
  String? error;
  String? message;
  Map<String, dynamic>? data;

  ExecutePayPalPaymentResponseModel(
      {this.success, this.error, this.message, this.data});

  ExecutePayPalPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] is Map<String, dynamic> ? json['data'] : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'message': message,
        if (data != null) 'data': data,
      };
}

// ─── Payment History Item ────────────────────────────────────
class PaymentHistoryItem {
  String? sId;
  String? id;
  num? amount;
  String? currency;
  String? status;
  String? method;
  String? createdAt;

  PaymentHistoryItem({
    this.sId,
    this.id,
    this.amount,
    this.currency,
    this.status,
    this.method,
    this.createdAt,
  });

  PaymentHistoryItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    amount = json['amount'];
    currency = json['currency'];
    status = json['status'];
    method = json['method'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'amount': amount,
        'currency': currency,
        'status': status,
        'method': method,
        'createdAt': createdAt,
      };
}

// ─── GET /payments/history ───────────────────────────────────
class PaymentHistoryData {
  List<PaymentHistoryItem>? payments;

  PaymentHistoryData({this.payments});

  PaymentHistoryData.fromJson(Map<String, dynamic> json) {
    payments = (json['payments'] as List<dynamic>?)
        ?.map((e) => PaymentHistoryItem.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'payments': payments?.map((e) => e.toJson()).toList(),
      };
}

class GetPaymentHistoryResponseModel {
  bool? success;
  String? error;
  PaymentHistoryData? data;

  GetPaymentHistoryResponseModel({this.success, this.error, this.data});

  GetPaymentHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null
        ? PaymentHistoryData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /plans ─────────────────────────────────────────────
class CreatePlanResponseModel {
  bool? success;
  String? error;
  Map<String, dynamic>? data;

  CreatePlanResponseModel({this.success, this.error, this.data});

  CreatePlanResponseModel.fromJson(Map<String, dynamic> json) {
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

// ─── Subscription Item ───────────────────────────────────────
class SubscriptionItem {
  String? sId;
  String? id;
  String? plan;
  String? status;
  String? startDate;
  String? endDate;
  bool? isActive;

  SubscriptionItem({
    this.sId,
    this.id,
    this.plan,
    this.status,
    this.startDate,
    this.endDate,
    this.isActive,
  });

  SubscriptionItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    plan = json['plan'] is Map
        ? json['plan']['_id'] ?? json['plan']['id']
        : json['plan'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'id': id,
        'plan': plan,
        'status': status,
        'startDate': startDate,
        'endDate': endDate,
        'isActive': isActive,
      };
}

// ─── POST /subscriptions ─────────────────────────────────────
class CreateSubscriptionResponseModel {
  bool? success;
  String? error;
  SubscriptionItem? data;

  CreateSubscriptionResponseModel({this.success, this.error, this.data});

  CreateSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? SubscriptionItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── GET /subscriptions/my-subscription ─────────────────────
class GetMySubscriptionResponseModel {
  bool? success;
  String? error;
  SubscriptionItem? data;

  GetMySubscriptionResponseModel({this.success, this.error, this.data});

  GetMySubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? SubscriptionItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /subscriptions/renew ───────────────────────────────
class RenewSubscriptionResponseModel {
  bool? success;
  String? error;
  SubscriptionItem? data;

  RenewSubscriptionResponseModel({this.success, this.error, this.data});

  RenewSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? SubscriptionItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}

// ─── POST /subscriptions/cancel ──────────────────────────────
class CancelSubscriptionResponseModel {
  bool? success;
  String? error;
  String? message;

  CancelSubscriptionResponseModel({this.success, this.error, this.message});

  CancelSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
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

// ─── GET /subscriptions/renewal-info ────────────────────────
class RenewalInfoData {
  String? renewalDate;
  String? planName;
  num? price;
  String? currency;
  bool? autoRenew;

  RenewalInfoData({
    this.renewalDate,
    this.planName,
    this.price,
    this.currency,
    this.autoRenew,
  });

  RenewalInfoData.fromJson(Map<String, dynamic> json) {
    renewalDate = json['renewalDate'];
    planName = json['planName'];
    price = json['price'];
    currency = json['currency'];
    autoRenew = json['autoRenew'];
  }

  Map<String, dynamic> toJson() => {
        'renewalDate': renewalDate,
        'planName': planName,
        'price': price,
        'currency': currency,
        'autoRenew': autoRenew,
      };
}

class GetRenewalInfoResponseModel {
  bool? success;
  String? error;
  RenewalInfoData? data;

  GetRenewalInfoResponseModel({this.success, this.error, this.data});

  GetRenewalInfoResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? RenewalInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        if (data != null) 'data': data!.toJson(),
      };
}
