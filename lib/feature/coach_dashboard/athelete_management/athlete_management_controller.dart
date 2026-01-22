import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';

class AthleteManagementController with ChangeNotifier {
  AppRepoService appRepoService;
  AthleteManagementController({required this.appRepoService});
  final searchController = TextEditingController();
  String selectedFilter = "Tutto";
  void setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  bool _isNotificationDetail = false;
  bool get isNotificationDetail => _isNotificationDetail;
  set isNotificationDetail(bool value) {
    _isNotificationDetail = value;
    notifyListeners();
  }

  bool _isAtheletDetail = false;
  bool get isAtheletDetail => _isAtheletDetail;
  set isAtheletDetail(bool value) {
    _isAtheletDetail = value;
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

  List rollAtheletList = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  int _currentPage = 1;
  final int _limit = 20;

  Future getRollAthelet(BuildContext context, {bool loadMore = false}) async {
    if (_isLoading) return;

    if (!loadMore) {
      _currentPage = 1;
      rollAtheletList.clear();
      _hasMore = true;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final response = await appRepoService.getRoleAthlete(
        page: _currentPage,
        limit: _limit,
      );

      if (response.success == true) {
        List rollAthelet = response.data!.users!;

        if (rollAthelet.isEmpty) {
          _hasMore = false;
        } else {
          rollAtheletList.addAll(rollAthelet);
          _currentPage++;
        }

        notifyListeners();
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "Server Error",
          isSuccess: false,
        );
      }
    } catch (e) {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Something went wrong",
        isSuccess: false,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
