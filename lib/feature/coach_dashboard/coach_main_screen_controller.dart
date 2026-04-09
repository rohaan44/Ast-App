import 'dart:async';

import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class CoachMainScreenController extends ChangeNotifier {
  final AppRepoService appRepoService;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;
  bool get hasMore => _hasMore;
  int _currentPage = 1;
  final int _limit = 20;

  // 1. Change this to a List (to store the accumulated users)
  List<dynamic> _coachesList = [];
  List<dynamic> get coachesList => _coachesList;

  final List<Map<String, String>> athletes = [
    {
      'name': 'John Doe',
      'status': 'Attiva',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
    {
      'name': 'Mitchel Johnson',
      'status': 'PROVA',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
    {
      'name': 'Max William',
      'status': 'Attiva',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
    {
      'name': 'David Warner',
      'status': 'Inattiva',
      'type': 'PRO',
      'lastCheckin': 'Aug,28'
    },
    {
      'name': 'Emily Carter',
      'status': 'Attiva',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
    {
      'name': 'Chris Brown',
      'status': 'PROVA',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
    {
      'name': 'Joe Wilson',
      'status': 'Attiva',
      'type': 'PRO',
      'lastCheckin': 'Sep,20'
    },
  ];

  CoachMainScreenController({required this.appRepoService});
  // Keep the other variables

  Timer? _refreshTimer;

  bool _timerStarted = false;

  void startPendingRequestsTimer(BuildContext context) {
    if (_timerStarted) return;
    _timerStarted = true;

    // 1. Pehli baar call karein (Initial Call)
    getAtheletPendingRequest(context: context);

    // 2. Har 1 minute baad ke liye timer set karein
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      getAtheletPendingRequest(context: context, loadMore: false);
    });
  }

  Future<void> getAtheletPendingRequest(
      {required BuildContext context, bool loadMore = false}) async {
    if (_isLoading) return;
    if (loadMore && !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    if (loadMore) {
      _currentPage++;
    } else {
      _currentPage = 1;
      _hasMore = true;
    }

    await runApiCall(
      apiCall: () => appRepoService.getAtheletPendingRequest(
          page: _currentPage, limit: _limit),
      context: context,
      onSuccess: (response) async {
        final data = response['data'] ?? {};
        List<dynamic> newUsers = data['users'] ?? [];
        Map<String, dynamic> pagination = data['pagination'] ?? {};
        int totalPages = pagination['pages'] ?? 1;

        if (loadMore) {
          _coachesList.addAll(newUsers);
        } else {
          _coachesList = newUsers;
        }
        _hasMore = _currentPage < totalPages;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> acceptReqAthelet(context, String relationshipId) async {
    final response = await appRepoService.acceptReqAthelet(
      relationshipId: relationshipId,
    );
    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "Request accepted successfully",
        isSuccess: true,
      );
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to accept request",
        isSuccess: false,
      );
    }
  }

  Future<void> rejectReqAthelet(context, String relationshipId) async {
    final response = await appRepoService.rejectReqAthelet(
      relationshipId: relationshipId,
    );
    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "Request rejected successfully",
        isSuccess: true,
      );
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to reject request",
        isSuccess: false,
      );
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}
