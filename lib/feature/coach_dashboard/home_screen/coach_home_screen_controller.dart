import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class CoachHomeScreenController with ChangeNotifier {
  final AppRepoService appRepoService;

  CoachHomeScreenController({required this.appRepoService});

  List<dynamic> _coachesList = [];
  List<dynamic> get coachesList => _coachesList;

  // Keep the other variables
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;
  bool get hasMore => _hasMore;
  int _currentPage = 1;
  final int _limit = 20;

  // Future<void> getAllMyAtheletes(
  //     {required BuildContext context, bool loadMore = false}) async {
  //   if (_isLoading) return;
  //   if (loadMore && !_hasMore) return;

  //   _isLoading = true;
  //   notifyListeners();

  //   if (loadMore) {
  //     _currentPage++;
  //   } else {
  //     _currentPage = 1;
  //     _hasMore = true;
  //   }

  //   await runApiCallWithError(
  //     apiCall: () =>
  //         appRepoService.getCoachNotifications(page: _currentPage, limit: _limit),
  //     context: context,
  //     onSuccess: (response) async {
  //       List<dynamic> newUsers = response['data']['users'];
  //       Map<String, dynamic> pagination = response['data']['pagination'];
  //       int totalPages = pagination['pages'];

  //       if (loadMore) {
  //         _coachesList.addAll(newUsers);
  //       } else {
  //         _coachesList = newUsers;
  //       }
  //       _hasMore = _currentPage < totalPages;
  //     },
  //   );

  //   _isLoading = false;
  //   notifyListeners();
  // }

  // Future<void> getAllMyAtheletes({
  //   required BuildContext context,
  //   bool loadMore = false,
  // }) async {
  //   if (_isLoading) return;
  //   if (loadMore && !_hasMore) return;

  //   _isLoading = true;
  //   notifyListeners();

  //   if (loadMore) {
  //     _currentPage++;
  //   } else {
  //     _currentPage = 1;
  //     _hasMore = true;
  //   }

  //   /// 🔹 API 1 (MAIN DATA)
  //   await runApiCallWithError(
  //     context: context,
  //     apiCall: () => appRepoService.getCoachNotifications(
  //       page: _currentPage,
  //       limit: _limit,
  //     ),
  //     onSuccess: (response1) async {
  //       /// ✅ API 1 DATA SET IMMEDIATELY
  //       List<dynamic> newUsers = response1['data']['users'];
  //       Map<String, dynamic> pagination = response1['data']['pagination'];
  //       int totalPages = pagination['pages'];

  //       if (loadMore) {
  //         _coachesList.addAll(newUsers);
  //       } else {
  //         _coachesList = newUsers;
  //       }

  //       _hasMore = _currentPage < totalPages;
  //       notifyListeners();

  //       /// 🔹 API 2 (OPTIONAL)
  //       try {
  //         await runApiCallWithError(
  //           context: context,
  //           apiCall: () => appRepoService.getCoahRelationshipAthelet(),
  //           onSuccess: (response2) async {
  //             /// 🔹 API 3 (OPTIONAL)
  //             try {
  //               await runApiCallWithError(
  //                 context: context,
  //                 apiCall: () => appRepoService.getCheckins(),
  //                 onSuccess: (response3) async {
  //                   debugPrint("API 3 success");

  //                   try {
  //                     await runApiCallWithError(
  //                         apiCall: () =>
  //                             appRepoService.getCoahWorkoutsMyCreated(),
  //                         context: context,
  //                         onSuccess: (response4) async {
  //                           debugPrint("API 4 success");
  //                         });
  //                   } catch (_) {
  //                     debugPrint("API 4 failed – ignoring");
  //                   }
  //                 },
  //               );
  //             } catch (_) {
  //               debugPrint("API 3 failed – ignoring");
  //             }
  //           },
  //         );
  //       } catch (_) {
  //         debugPrint("API 2 failed – ignoring");
  //       }
  //     },
  //   );

  //   _isLoading = false;
  //   notifyListeners();
  // }
  // BuildContext? _context;

  // void setContext(BuildContext context) {
  //   _context = context;
  // }

  Future<bool> _fetchAthletes(BuildContext context, bool loadMore) async {
    bool isSuccess = false;

    await runApiCallWithError(
      context: context,
      apiCall: () => appRepoService.getCoachNotifications(
        page: _currentPage,
        limit: _limit,
      ),
      onSuccess: (response1) async {
        final users = response1['data']['users'];
        final pages = response1['data']['pagination']['pages'];

        if (loadMore) {
          _coachesList.addAll(users);
        } else {
          _coachesList = users;
        }

        _hasMore = _currentPage < pages;
        isSuccess = true;
      },
    );

    notifyListeners();
    return isSuccess;
  }

  Future<void> _fetchCoachRelations(context) async {
    try {
      await runApiCallWithError(
        context: context,
        apiCall: () => appRepoService.getCoahRelationshipAthelet(),
        onSuccess: (response2) async {},
      );
    } catch (e) {}
  }

  Future<void> _fetchCheckins(context) async {
    try {
      await runApiCallWithError(
        context: context,
        apiCall: () => appRepoService.getCheckins(),
        onSuccess: (response3) async {},
      );
    } catch (e) {}
  }

  Future<void> _fetchWorkouts(context) async {
    try {
      await runApiCallWithError(
        context: context,
        apiCall: () => appRepoService.getCoahWorkoutsMyCreated(),
        onSuccess: (response4) async {},
      );
    } catch (e) {}
  }

  Future<void> getAllMyAtheletes({
    required context,
    bool loadMore = false,
  }) async {
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

    /// API 1 (must run first)
    final athletesSuccess = await _fetchAthletes(context, loadMore);

    if (!athletesSuccess && loadMore) {
      _currentPage--; // rollback page
    }

    /// Baqi APIs parallel + counted in loading
    if (athletesSuccess) {
      await Future.wait([
        _fetchCoachRelations(context),
        _fetchCheckins(context),
        _fetchWorkouts(context),
      ]);
    }

    /// 🔥 Ab sab APIs COMPLETE (success ya fail)
    _isLoading = false;
    notifyListeners();
  }
}
