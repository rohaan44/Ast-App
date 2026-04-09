import 'package:ast_official/data/repository/payment_repo.dart';

class PaymentRepoService {
  final PaymentRepo paymentRepo;

  PaymentRepoService({required this.paymentRepo});

  // ================= PAYMENTS =================

  Future<Map<String, dynamic>> createPaymentIntent(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.createPaymentIntent(body: body);
  }

  Future<Map<String, dynamic>> confirmPayment(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.confirmPayment(body: body);
  }

  Future<Map<String, dynamic>> createPayPalPayment(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.createPayPalPayment(body: body);
  }

  Future<Map<String, dynamic>> executePayPalPayment(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.executePayPalPayment(body: body);
  }

  Future<Map<String, dynamic>> getPaymentHistory(
      {int page = 1, int limit = 20}) async {
    return paymentRepo.getPaymentHistory(page: page, limit: limit);
  }

  // ================= PLANS =================

  Future<Map<String, dynamic>> createPlan(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.createPlan(body: body);
  }

  // ================= SUBSCRIPTIONS =================

  Future<Map<String, dynamic>> createSubscription(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.createSubscription(body: body);
  }

  Future<Map<String, dynamic>> getMySubscription() async {
    return paymentRepo.getMySubscription();
  }

  Future<Map<String, dynamic>> renewSubscription(
      {required Map<String, dynamic> body}) async {
    return paymentRepo.renewSubscription(body: body);
  }

  Future<Map<String, dynamic>> cancelSubscription() async {
    return paymentRepo.cancelSubscription();
  }

  Future<Map<String, dynamic>> getRenewalInfo() async {
    return paymentRepo.getRenewalInfo();
  }

  // ================= SUBSCRIPTION STATUS =================

  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    return paymentRepo.getSubscriptionStatus();
  }

  // ================= PLANS =================

  Future<Map<String, dynamic>> getPlans({
    String? type,
    bool? isActive,
  }) async {
    return paymentRepo.getPlans(type: type, isActive: isActive);
  }
}
