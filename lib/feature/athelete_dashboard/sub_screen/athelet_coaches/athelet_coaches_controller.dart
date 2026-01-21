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
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
  ];

  List<Map<String, String>> get filteredCoaches {
    return atheletCoaches.where((coach) {
      final title = coach["title"]!.toLowerCase();
      final subTitle = coach["subTitle"]!.toLowerCase();

      final matchesSearch =
          title.contains(_searchQuery) || subTitle.contains(_searchQuery);

      if (selectedCategoryIndex == 0) {
        return matchesSearch; // Tutti
      }

      final selectedCategory = categories[selectedCategoryIndex].toLowerCase();

      final matchesCategory = subTitle.contains(selectedCategory);

      return matchesSearch && matchesCategory;
    }).toList();
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

  Future<void> getCoaches(
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

    _isLoading = false;
    notifyListeners();
  }
}
