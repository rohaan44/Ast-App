import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class CheckInReviewsController extends ChangeNotifier {
  final AppRepoService appRepoService;

  CheckInReviewsController({required this.appRepoService});
  // 🔹 Filter options
  final List<String> filterOptions = ["Tutto", "In attesa di", "Recensito"];

  // 🔹 Current filter
  String selectedFilter = "Tutto";

  // 🔹 All athletes as Map list
  final List<Map<String, dynamic>> allAthletes = [
    {
      "name": "John Doe",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/4.jpg",
    },
    {
      "name": "Mitchel Johnson",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/3.jpg",
    },
    {
      "name": "Max William",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/2.jpg",
    },
    {
      "name": "David Warner",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Emily Carter",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/20.jpg",
    },
    {
      "name": "Chris Brown",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/8.jpg",
    },
  ];
  List<Map<String, dynamic>> get athletes {
    switch (selectedFilter) {
      case "Recensito":
        return allAthletes.where((a) => a["isReviewed"] == true).toList();
      case "In attesa di":
        return allAthletes.where((a) => a["isReviewed"] == false).toList();
      default:
        return allAthletes;
    }
  }

  void setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  String _searchQuery = '';
  void filterBySearch(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<Map<String, dynamic>> get filteredAthletes {
    final filtered = athletes;
    if (_searchQuery.isEmpty) return filtered;
    return filtered
        .where(
            (a) => (a["name"] as String).toLowerCase().contains(_searchQuery))
        .toList();
  }

  // 1. Change this to a List (to store the accumulated users)
  List<dynamic> _coachesList = [];
  List<dynamic> get coachesList => _coachesList;

  // Keep the other variables
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;
  bool get hasMore => _hasMore;
  int _currentPage = 1;
  final int _limit = 20;

  Future<void> getCoahCheckInReview(
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

    await runApiCallWithError(
      apiCall: () =>
          appRepoService.getCoahCheckins(page: _currentPage, limit: _limit),
      context: context,
      onSuccess: (response) async {
        final data = response['data'] ?? {};
        final list = data['checkIns'] ?? data['users'] ?? [];
        final pagination = data['pagination'] ?? {};
        final int totalPages = pagination['pages'] ?? 1;

        // Future.delayed(
        //  const   Duration(
        //       minutes: 1,
        //     ), () {
        //   showApiSnackBar(
        //     context,
        //     title: "ponka",
        //     message: "ponkaaaa",
        //     isSuccess: false,
        //   );
        // });
        if (loadMore) {
          _coachesList.addAll(list);
        } else {
          _coachesList = list;
        }
        _hasMore = _currentPage < totalPages;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
