import 'package:ast_official/data/models/base_model/base_model.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

Future<bool> runApiCall({
  required Future<dynamic> Function() apiCall,
  required BuildContext context,
  required Future<void> Function(dynamic response)?
      onSuccess, // pass response here
  String errorMessage = "Something went wrong",
}) async {
  try {
    final response = await apiCall();

    if (response == true || (response is Map && response['success'] == true)) {
      if (onSuccess != null) {
        await onSuccess(response); // pass response to callback
      }
      return true;
    }

    if (context.mounted && response is Map) {
      showApiSnackBar(
        context,
        title: "Error",
        message: response['error'] ?? errorMessage,
        isSuccess: false,
      );
    }

    return false;
  } catch (e) {
    if (context.mounted) {
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    }
    return false;
  }
}

Future<bool> runApiCallWithError({
  required Future<dynamic> Function() apiCall,
  required BuildContext context,
  required Future<void> Function(dynamic response)? onSuccess,
  String errorMessage = "Something went wrong",
}) async {
  try {
    final response = await apiCall();

    if (response == true || (response is Map && response['success'] == true)) {
      if (onSuccess != null) {
        await onSuccess(response);
      }
      return true;
    }

    // ❌ API returned failure
    if (response is Map) {
      debugPrint("❌ API failed: ${response['error'] ?? errorMessage}");
    } else {
      debugPrint("❌ API failed: $errorMessage (Response is not a map: $response)");
    }

    if (context.mounted && response is Map) {
      showApiSnackBar(
        context,
        title: "Error",
        message: response['error'] ?? errorMessage,
        isSuccess: false,
      );
    }

    return false;
  } catch (e) {
    debugPrint("❌ API exception: $e"); // <-- add this
    if (context.mounted) {
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    }
    return false;
  }
}

Future<bool> runApiCallWithModel<T extends BaseApiResponse>({
  required Future<T> Function() apiCall,
  required BuildContext context,
  Future<void> Function(T response)? onSuccess,
  String fallbackError = "Something went wrong",
}) async {
  try {
    final T response = await apiCall();

    if (response.success) {
      if (onSuccess != null) {
        await onSuccess(response);
      }
      return true;
    }

    if (context.mounted) {
      debugPrint("Error on if block: ${response.error}");
      showApiSnackBar(
        context,
        title: "Error",
        message: response.error ?? fallbackError,
        isSuccess: false,
      );
    }

    return false;
  } catch (e) {
    if (context.mounted) {
      debugPrint("Error on catch block: ${e.toString()}");
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    }
    return false;
  }
}
