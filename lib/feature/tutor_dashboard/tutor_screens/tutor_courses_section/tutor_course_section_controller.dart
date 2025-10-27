import 'package:flutter/material.dart';

class TutorCourseSectionController with ChangeNotifier {
  final List<String> filterTabs = ['Tutti', 'Attivo', 'Completato', 'Bozza'];

  final searchController = TextEditingController();
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  void setSelectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  final List<Map<String, dynamic>> allCourses = [
    {
      'title': 'Forza e Condizionamento – Livello 1',
      'modules': 8,
      'students': 120,
      'status': 'Attivo',
    },
    {
      'title': 'Certificazione di Specialista in Nutrizione',
      'modules': 6,
      'students': 90,
      'status': 'Bozza',
    },
    {
      'title': 'Strength & Conditioning – Level 1',
      'modules': 8,
      'students': 130,
      'status': 'Attivo',
    },
    {
      'title': 'Certificazione di Specialista in Nutrizione (Pro)',
      'modules': 6,
      'students': 60,
      'status': 'Bozza',
    },
    {
      'title': 'Certificazione di Specialista in Nutrizione (Trainee)',
      'modules': 9,
      'students': 35,
      'status': 'Attivo',
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    if (_selectedTab == 0) return allCourses;
    final selectedLabel = filterTabs[_selectedTab];
    return allCourses.where((c) => c['status'] == selectedLabel).toList();
  }
}
