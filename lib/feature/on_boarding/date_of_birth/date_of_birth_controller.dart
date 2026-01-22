import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DateOfBirthController extends ChangeNotifier {
  final OnboardingRepoService onboardingRepoService;
  DateOfBirthController({required this.onboardingRepoService}) {
    // Initialize with default values if needed
    _selectedDay = days[0];
    _selectedMonth = months[0];
    // Set a default year, e.g., 1990, for a better user experience
    _selectedYear = '1990';
    // You can also create a FixedExtentScrollController for each wheel
    // to programmatically set the initial item.
  }

  // --- DATA LISTS ---

  // List of days (1-31)
  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());

  // List of months in Italian
  final List<String> months = [
    'Gen',
    'Feb',
    'Mar',
    'Apr',
    'Mag',
    'Giu',
    'Lug',
    'Agos',
    'Sett',
    'Ott',
    'Nov',
    'Dic'
  ];

  // List of years from 1960 to the current year
  final List<String> years = List.generate(
      DateTime.now().year - 1960 + 1, // Total number of years
      (index) => (1960 + index).toString() // Generate year string
      ).reversed.toList(); // Reverse so recent years are at the top

  // --- SELECTED VALUES ---
  late String _selectedDay;
  late String _selectedMonth;
  late String _selectedYear;

  // --- GETTERS to access selected values ---
  String get selectedDay => _selectedDay;
  String get selectedMonth => _selectedMonth;
  String get selectedYear => _selectedYear;
  String get fullDate {
    String day = _selectedDay.padLeft(2, '0');
    int monthIndex = months.indexOf(_selectedMonth) + 1;
    String month = monthIndex.toString().padLeft(2, '0');
    return '$_selectedYear-$month-$day';
  }

  // --- METHODS to update the state ---
  void setSelectedDay(int index) {
    _selectedDay = days[index];
  }

  void setSelectedMonth(int index) {
    _selectedMonth = months[index];
  }

  void setSelectedYear(int index) {
    _selectedYear = years[index];
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future sendDateOfBirth(context, String dateOfBirth) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response =
          await onboardingRepoService.sendDateOfBirth(dateOfBirth: dateOfBirth);

      if (response['success'] == true) {
        final bool success = response['success'] == true;
        final String message = response['message'] ?? 'Something went wrong';
        showApiSnackBar(
          context,
          title: "Success",
          message: message,
          isSuccess: success,
        );
        Navigator.pushNamedAndRemoveUntil(
            context, RoutePaths.selectGender, (route) => false);
      } else {
        showApiSnackBar(
          context,
          title: "Error",
          message: "${response['message']}",
          isSuccess: false,
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint(e.toString());
      showApiSnackBar(
        context,
        title: "Error",
        message: e.toString(),
        isSuccess: false,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
