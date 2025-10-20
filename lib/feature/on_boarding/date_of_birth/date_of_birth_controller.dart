import 'package:flutter/foundation.dart';

class DateOfBirthController extends ChangeNotifier {
  DateOfBirthController() {
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
  final List<String> days = List.generate(31, (index) => (index + 1).toString());

  // List of months in Italian
  final List<String> months = [
    'Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu',
    'Lug', 'Agos', 'Sett', 'Ott', 'Nov', 'Dic'
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
  String get fullDate => '$_selectedDay $_selectedMonth $_selectedYear';


  // --- METHODS to update the state ---
  void setSelectedDay(int index) {
    _selectedDay = days[index];
    // No need to call notifyListeners() if you only want to read the final date once
    // Call it if other parts of the UI need to react to the change instantly.
  }

  void setSelectedMonth(int index) {
    _selectedMonth = months[index];
  }

  void setSelectedYear(int index) {
    _selectedYear = years[index];
  }
}