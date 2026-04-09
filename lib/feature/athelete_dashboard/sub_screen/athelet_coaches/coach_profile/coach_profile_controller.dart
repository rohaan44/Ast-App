import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';

import 'package:flutter/material.dart';

class CoachProfileController with ChangeNotifier {
  final AppRepoService appRepoService;
  bool isAboutExpanded = false;

  CoachProfileController({required this.appRepoService}) {
    // _init();
    // getCoachProfileById(id: "", context: context);
  }

  void toggleAboutExpanded() {
    isAboutExpanded = !isAboutExpanded;
    notifyListeners();
  }

  final List<Map<String, dynamic>> workouts = [
    {
      "title": "Mountain Climbers",
      "subtitle": "Attivazione del core + cardio",
      "badges": ["3 serie x 20 sec", "12 kcal"],
      "tags": ["Principiante", "Allenamento di 4 settimane"],
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
    }
  ];

  final Map<String, dynamic> reviewStats = {
    "rating": 4.5,
    "totalRatings": "200k",
    "totalReviews": "31k",
    "distribution": [0.8, 0.6, 0.4, 0.2, 0.1], // 5 to 1 stars
  };
  // void _init() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   isLoading = false;
  //   notifyListeners();
  // }
  Map<String, dynamic>? _coachProfile;
  Map<String, dynamic>? get coachProfile => _coachProfile;

  void clearProfile() {
    _coachProfile = null;
    _isFirstFetchDone = false;
    isPending = false;
    myCoaches.clear();
    notifyListeners();
  }

  bool _isSendingRequest = false;
  bool get isSendingRequest => _isSendingRequest;

  bool _isFetchingCoaches = false;
  bool get isFetchingCoaches => _isFetchingCoaches;

  bool _isFirstFetchDone = false;
  bool get isFirstFetchDone => _isFirstFetchDone;

  final List<dynamic> myCoaches = [];
  bool isPending = false;

  Future<void> sendCoachRequest({
    required String coachId,
    required BuildContext context,
  }) async {
    if (_isSendingRequest) return;
    _isSendingRequest = true;
    notifyListeners();

    await runApiCall(
      context: context,
      apiCall: () => appRepoService.sendCoachRequest(coachId: coachId),
      onSuccess: (_) async {
        showApiSnackBar(
          context,
          title: "Success",
          message: "Coach request sent successfully",
          isSuccess: true,
        );
        _isFirstFetchDone = false; // Reset to allow refresh
        await getMyCoaches(context: context, coachId: coachId);
      },
    );

    _isSendingRequest = false;
    notifyListeners();
  }

  Future<void> getMyCoaches({
    required BuildContext context,
    required String coachId,
    bool forceRefresh = false,
  }) async {
    if ((_isFetchingCoaches || _isFirstFetchDone) && !forceRefresh) return;

    _isFetchingCoaches = true;
    notifyListeners();

    await runApiCall(
      context: context,
      apiCall: () => appRepoService.getMyCoaches(),
      onSuccess: (response) async {
        myCoaches
          ..clear()
          ..addAll(response['data']['relationships']);

        isPending = myCoaches.any((r) =>
            (r['coachId'] == coachId || r['coach']?['_id'] == coachId) &&
            r['status'] == 'pending');
      },
    );

    _isFirstFetchDone = true;
    _isFetchingCoaches = false;
    notifyListeners();
  }

  // Future<void> getCoachProfileById(ui
  //     {required String id, required BuildContext context}) async {
  //   if (isLoading || _lastFetchedId == id) return;

  //   _lastFetchedId = id;
  //   isLoading = true;
  //   notifyListeners();
  //   await runApiCall(
  //       apiCall: () => appRepoService.getCoachProfileById(id: id),
  //       context: context,
  //       onSuccess: (response) async {
  //         // Robust parsing for different API response structures
  //         final dynamic data = response['data'];
  //         if (data is Map) {
  //           final List? users = data['users'];
  //           if (users != null && users.isNotEmpty) {
  //             _coachProfile = users.first as Map<String, dynamic>;
  //           } else if (data.containsKey('_id') || data.containsKey('id')) {
  //             _coachProfile = data as Map<String, dynamic>;
  //           } else {
  //             _coachProfile = response as Map<String, dynamic>;
  //           }
  //         } else {
  //           _coachProfile = response as Map<String, dynamic>;
  //         }
  //       });
  //   isLoading = false;
  //   notifyListeners();
  // }
  bool isCoachRequestPending({
    required List<dynamic> requests,
    required String coachId,
  }) {
    return requests.any((item) =>
        item['coach']?['_id'] == coachId && item['status'] == "pending");
  }

  @override
  void dispose() {
    debugPrint("CoachProfileController DISPOSED");
    super.dispose();
  }
}
