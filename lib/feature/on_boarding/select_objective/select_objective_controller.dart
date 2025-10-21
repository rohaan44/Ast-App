import 'package:flutter/foundation.dart';

class SelectObjectiveController extends ChangeNotifier {
  // --- DATA ---
  // Lists of options to display in the UI
  final List<String> fitnessGoals = [
    'Perdita di grasso',
    'Prestazioni',
    'Idoneità generale',
    'Muscoli',
    'Addominali',
    'Bicipiti',
  ];

  final List<String> experienceLevels = [
    'Principiante',
    'Intermedio',
    'Avanzato',
  ];

  // --- STATE ---
  // Private variables to hold the current state
  final List<String> _selectedGoals = [];
  String? _selectedExperience;

  // --- GETTERS ---
  // Public getters to safely access the state from the UI
  List<String> get selectedGoals => _selectedGoals;
  String? get selectedExperience => _selectedExperience;

  // --- METHODS ---
  // Methods to update the state. Calling notifyListeners() tells the UI to rebuild.

  /// Toggles the selection for a fitness goal. Allows for multiple selections.
  void toggleFitnessGoal(String goal) {
    if (_selectedGoals.contains(goal)) {
      _selectedGoals.remove(goal);
    } else {
      _selectedGoals.add(goal);
    }
    notifyListeners();
  }

  /// Sets the experience level. Allows for only one selection.
  void selectExperience(String level) {
    _selectedExperience = level;
    notifyListeners();
  }
}