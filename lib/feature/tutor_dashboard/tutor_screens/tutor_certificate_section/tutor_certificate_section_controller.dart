import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class TutorCertificateSectionController with ChangeNotifier {
  final AppRepoService appRepoService;

  TutorCertificateSectionController({required this.appRepoService});

  List filterTabs = ['All', 'Active', 'Pending', 'Expired'];

  final searchController = TextEditingController();
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Map<String, dynamic>> _certifications = [];
  List<Map<String, dynamic>> get certifications => _certifications;

  void setSelectedTab(int index, BuildContext context) {
    _selectedTab = index;
    notifyListeners();
    // In local filtering scenario (if API returns all), we don't need to refetch.
    // But if API filters, we do. The user said "GetAllCoaches", implying we might fetch all and filter.
    // However, the previous API had 'status' param. Let's keep fetching or filter locally if data is already there.
    // For now, let's trigger fetch to be safe/consistent with previous implementation.
    fetchCertifications(context);
  }

  Future<void> fetchCertifications(BuildContext context) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // API status param mapping:
      // All -> ''
      // Active -> 'active'
      // Pending -> 'pending'
      // Expired -> 'expired'
      String statusParam = '';
      if (_selectedTab != 0) {
        statusParam = filterTabs[_selectedTab].toString().toLowerCase();
      }

      await runApiCallWithError(
          context: context,
          apiCall: () => appRepoService.getCertifications(status: statusParam),
          onSuccess: (response) async {
            if (response is Map<String, dynamic> &&
                response.containsKey('data')) {
              var data = response['data'];
              if (data is Map && data.containsKey('certifications')) {
                var list = data['certifications'];
                if (list is List) {
                  _certifications = List<Map<String, dynamic>>.from(list);
                }
              } else if (data is List) {
                _certifications = List<Map<String, dynamic>>.from(data);
              } else {
                _certifications = [];
              }
            } else {
              _certifications = [];
            }
          });
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> get filteredCourses {
    // If API returns filtered data, we show everything in _certifications.
    return _certifications;
  }
}
