import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';

class PaymentRepo {
  static final DioHelper _dioHelper = DioHelper();

  // ================= PAYMENTS =================

  /// POST /payments/create-intent
  Future<Map<String, dynamic>> createPaymentIntent(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}payments/create-intent",
      requestBody: body,
    );
    return response;
  }

  /// POST /payments/confirm
  Future<Map<String, dynamic>> confirmPayment(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}payments/confirm",
      requestBody: body,
    );
    return response;
  }

  /// POST /payments/paypal/create
  Future<Map<String, dynamic>> createPayPalPayment(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}payments/paypal/create",
      requestBody: body,
    );
    return response;
  }

  /// POST /payments/paypal/execute
  Future<Map<String, dynamic>> executePayPalPayment(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}payments/paypal/execute",
      requestBody: body,
    );
    return response;
  }

  /// GET /payments/history
  Future<Map<String, dynamic>> getPaymentHistory(
      {int page = 1, int limit = 20}) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}payments/history",
      queryParameters: {"page": page, "limit": limit},
    );
    return response;
  }

  // ================= PLANS =================

  /// POST /plans
  Future<Map<String, dynamic>> createPlan(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}plans",
      requestBody: body,
    );
    return response;
  }

  // ================= SUBSCRIPTIONS =================

  /// POST /subscriptions
  Future<Map<String, dynamic>> createSubscription(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions",
      requestBody: body,
    );
    return response;
  }

  /// GET /subscriptions/my-subscription
  Future<Map<String, dynamic>> getMySubscription() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions/my-subscription",
    );
    return response;
  }

  /// POST /subscriptions/renew
  Future<Map<String, dynamic>> renewSubscription(
      {required Map<String, dynamic> body}) async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions/renew",
      requestBody: body,
    );
    return response;
  }

  /// POST /subscriptions/cancel
  Future<Map<String, dynamic>> cancelSubscription() async {
    final response = await _dioHelper.post(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions/cancel",
      requestBody: {},
    );
    return response;
  }

  /// GET /subscriptions/renewal-info
  Future<Map<String, dynamic>> getRenewalInfo() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions/renewal-info",
    );
    return response;
  }

  // ================= SUBSCRIPTION STATUS =================

  /// GET /subscriptions/status
  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}subscriptions/status",
    );
    return response;
  }

  // ================= PLANS =================

  /// GET /plans
  Future<Map<String, dynamic>> getPlans({
    String? type,
    bool? isActive,
  }) async {
    final response = await _dioHelper.get(
      isAuthRequired: true,
      url: "${NetworkProperties.baseUrl}plans",
      queryParameters: {
        if (type != null) "type": type,
        if (isActive != null) "isActive": isActive,
      },
    );
    return response;
  }
}
