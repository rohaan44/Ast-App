import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class AtheletCoachesController extends ChangeNotifier {
  final AppRepoService appRepoService;
  AtheletCoachesController({required this.appRepoService}) {
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController = ScrollController();
  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  void _onScroll() {
    if (scrollController.hasClients &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        hasMore &&
        !isLoading) {
      if (_context != null) {
        getCoaches(context: _context!, loadMore: true);
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  int selectedCategoryIndex = 0;
  String _searchQuery = "";

  void setSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void setSearchQuery(String value) {
    _searchQuery = value.toLowerCase();
    notifyListeners();
  }

  final List<String> categories = [
    "Tutti",
    "Cardio",
    "Squat",
    "Stretching",
    "News",
    "Movies",
    "Tech",
    "Sports",
  ];

  final List<Map<String, String>> atheletCoaches = [
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Dianne Russell",
      "bio": "Forza • Cardio • Equilibrio"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "fullName": "Robert Fox",
      "bio": "Flessibilità • Anaerobico"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "fullName": "Jane Cooper",
      "bio": "Equilibrio • Forza",
    },
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Darleen Bratt",
      "bio": "Forza • Cardio • Equilibrio"
    },
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Dianne Russell",
      "bio": "Forza • Cardio • Equilibrio"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "fullName": "Robert Fox",
      "bio": "Flessibilità • Anaerobico"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "fullName": "Jane Cooper",
      "bio": "Equilibrio • Forza",
    },
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Darleen Bratt",
      "bio": "Forza • Cardio • Equilibrio"
    },
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Dianne Russell",
      "bio": "Forza • Cardio • Equilibrio"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "fullName": "Robert Fox",
      "bio": "Flessibilità • Anaerobico"
    },
    {
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "fullName": "Jane Cooper",
      "bio": "Equilibrio • Forza",
    },
    {
      "avatar":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "fullName": "Darleen Bratt",
      "bio": "Forza • Cardio • Equilibrio"
    },
  ];

  List<dynamic> get filteredCoaches {
    List<dynamic> source =
        _coachesList.isNotEmpty ? _coachesList : atheletCoaches;
    return source.where((coach) {
      final name = (coach["fullName"] ?? "").toString().toLowerCase();
      final bio = (coach["bio"] ?? "").toString().toLowerCase();

      final matchesSearch =
          name.contains(_searchQuery) || bio.contains(_searchQuery);

      if (selectedCategoryIndex == 0) {
        return matchesSearch; // Tutti
      }

      final selectedCategory = categories[selectedCategoryIndex].toLowerCase();

      final matchesCategory = bio.contains(selectedCategory);

      return matchesSearch && matchesCategory;
    }).toList();
  }

  // 1. Change this to a List (to store the accumulated users)
  List<dynamic> _coachesList = [];
  List<dynamic> get coachesList => _coachesList;

  bool _isFirstFetchDone = false;
  bool get isFirstFetchDone => _isFirstFetchDone;

  // Flags for loading states
  bool _isFirstLoading = false;
  bool get isFirstLoading => _isFirstLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  // Keep isLoading for compatibility or overall status
  bool get isLoading => _isFirstLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;
  int _currentPage = 1;
  final int _limit = 20;

  Future<void> getCoaches(
      {required BuildContext context, bool loadMore = false}) async {
    if (_isFirstFetchDone && !loadMore) return;
    if (_isFirstLoading || _isLoadingMore) return;
    if (loadMore && !_hasMore) return;

    if (loadMore) {
      _isLoadingMore = true;
    } else {
      _isFirstLoading = true;
      _currentPage = 1;
      _hasMore = true;
    }
    notifyListeners();

    if (loadMore) {
      _currentPage++;
    }

    await runApiCall(
      apiCall: () =>
          appRepoService.getCoaches(page: _currentPage, limit: _limit),
      context: context,
      onSuccess: (response) async {
        List<dynamic> newUsers = response['data']['users'];
        Map<String, dynamic> pagination = response['data']['pagination'];
        int totalPages = pagination['pages'];

        if (loadMore) {
          _coachesList.addAll(newUsers);
        } else {
          _coachesList = newUsers;
        }
        _hasMore = _currentPage < totalPages;
      },
    );

    _isFirstLoading = false;
    _isLoadingMore = false;
    _isFirstFetchDone = true;
    notifyListeners();
  }
}
