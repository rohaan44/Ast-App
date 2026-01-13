import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class OtpController with ChangeNotifier {
  final AuthRepoService authRepoService;

  CountdownTimerController? countdownTimerController;
  int? endTime;

  final otpTextController = TextEditingController();

  OtpController({required this.authRepoService}) {
    _initTimer(seconds: 30);
  }

  void _initTimer({required int seconds}) {
    endTime = DateTime.now().millisecondsSinceEpoch + seconds * 1000;

    countdownTimerController?.dispose(); // safe dispose
    countdownTimerController = CountdownTimerController(
      endTime: endTime!,
      onEnd: () {
        notifyListeners();
      },
    );

    notifyListeners();
  }

  /// 🔁 Resend flow timer
  void startTimerAgainSafely() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initTimer(seconds: 45);
    });
  }

  String formatTimer(int? time) {
    if (time == null) return '00';
    return time.toString().padLeft(2, '0');
  }

  void clearAndFocusPinCodeField() {
    otpTextController.clear();
    notifyListeners();
  }

  Future<void> resendOtp(BuildContext context, String email) async {
    final response = await authRepoService.sendOtp(email: email);

    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "OTP sent successfully",
        isSuccess: true,
      );
      startTimerAgainSafely(); // 🔥 restart timer safely
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to resend OTP",
        isSuccess: false,
      );
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

Future verifyOtp(context, String email, String code) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response =
          await authRepoService.verifyOtp(email: email, code: code);

      if (response['success'] == true) {
        final bool success = response['success'] == true;
        final String message = response['message'] ?? 'Something went wrong';
        showApiSnackBar(
          context,
          title: "Success",
          message: message,
          isSuccess: success,
        );
         Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RoutePaths.dateOfBirth,
                                    (route) => false,
                                  );
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response['message']}",
          isSuccess: false,
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    countdownTimerController?.dispose();
    otpTextController.dispose();
    super.dispose();
  }
}
