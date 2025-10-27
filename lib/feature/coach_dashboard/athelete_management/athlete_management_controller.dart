import 'package:flutter/cupertino.dart';

class AthleteManagementController with ChangeNotifier {
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
    {'name': 'John Doe', 'status': 'Attiva', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
    {'name': 'Mitchel Johnson', 'status': 'PROVA', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
    {'name': 'Max William', 'status': 'Attiva', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
    {'name': 'David Warner', 'status': 'Inattiva', 'type': 'PRO', 'lastCheckin': 'Aug,28'},
    {'name': 'Emily Carter', 'status': 'Attiva', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
    {'name': 'Chris Brown', 'status': 'PROVA', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
    {'name': 'Joe Wilson', 'status': 'Attiva', 'type': 'PRO', 'lastCheckin': 'Sep,20'},
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

  @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }
}