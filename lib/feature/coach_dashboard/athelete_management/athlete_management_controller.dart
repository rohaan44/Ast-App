import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';

class AthleteManagementController with ChangeNotifier {
  final AppRepoService appRepoService;

  AthleteManagementController({required this.appRepoService}) {
    searchController.addListener(notifyListeners);
    scrollController.addListener(_onScroll);
  }

  bool _isAtheletScreen = false;
  bool get isAtheletScreen => _isAtheletScreen;
  set isAtheletScreen(bool value) {
    _isAtheletScreen = value;
    notifyListeners();
  }

  bool _isNotificationScreen = true;
  bool get isNotificationScreen => _isNotificationScreen;
  set isNotificationScreen(bool value) {
    _isNotificationScreen = value;
    notifyListeners();
  }

  final searchController = TextEditingController();
  String selectedFilter = "Tutto";
  void setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  final List<String> filterOptions = [
    'Tutto',
    'Attiva',
    'Inattiva',
    'Trailing',
    'Stato'
  ];

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
  List<Map<String, String>> get filteredAthletes {
    if (selectedFilter == 'Tutto') {
      return athletes;
    }
    return athletes.where((athlete) {
      if (selectedFilter == 'Attiva' || selectedFilter == 'Inattiva') {
        return athlete['status'] == selectedFilter;
      }
      return athlete['filterKey'] == selectedFilter;
    }).toList();
  }

  // 1. Change this to a List (to store the accumulated users)
  List<dynamic> _coachesList = [];
  List<dynamic> get coachesList => _coachesList;
  bool _isFirstFetchDone = false;
  bool get isFirstFetchDone => _isFirstFetchDone;

  // Keep the other variables
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;
  bool get hasMore => _hasMore;
  int _currentPage = 1;
  final int _limit = 20;

  Future<void> getAllMyAtheletes(
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
          appRepoService.getAllMyAtheletes(page: _currentPage, limit: _limit),
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
    _isFirstFetchDone = true;
    notifyListeners();
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
    _isFirstFetchDone = true;
    notifyListeners();
  }

  Future<void> acceptReqAthelet(context, String status) async {
    final response = await appRepoService.acceptReqAthelet(
      status: status,
    );
    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "Exercise create successfully",
        isSuccess: true,
      );
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to resend OTP",
        isSuccess: false,
      );
    }
  }

  Future<void> rejectReqAthelet(context, String status) async {
    final response = await appRepoService.rejectReqAthelet(
      status: status,
    );
    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "Exercise create successfully",
        isSuccess: true,
      );
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to resend OTP",
        isSuccess: false,
      );
    }
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
        getAllMyAtheletes(context: _context!, loadMore: true);
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
