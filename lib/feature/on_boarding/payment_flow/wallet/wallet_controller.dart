import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
// import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class WalletController with ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;

  WalletController({required this.onboardingRepoService});

   String? _selectedMethod; // initially null

  String? get selectedMethod => _selectedMethod;

  void selectMethod(String method) {
    _selectedMethod = method;
    notifyListeners();
  }

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

// Future createPaymentIntent(context, String planId) async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       final response =
//           await onboardingRepoService.sendPaymentStripe(planId: planId);

//       if (response['success'] == true) {
//         final bool success = response['success'] == true;
//         final String message = response['message'] ?? 'Something went wrong';
//         showApiSnackBar(
//           context,
//           title: "Success",
//           message: message,
//           isSuccess: success,
//         );
//         //  Navigator.pushNamedAndRemoveUntil(
//         //                             context,
//         //                             RoutePaths.dateOfBirth,
//         //                             (route) => false,
//         //                           );
//       } else {
//         showApiSnackBar(
//           context,
//           title: "Error",
//           message: "${response['message']}",
//           isSuccess: false,
//         );
//       }
//     } catch (e) {
//       _isLoading = false;
//       notifyListeners();
//       showApiSnackBar(
//         context,
//         title: "Error",
//         message: e.toString(),
//         isSuccess: false,
//       );
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }


}