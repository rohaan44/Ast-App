import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectRoleController extends ChangeNotifier {
  // State
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  String? _selectedRole;

  String? get selectedRole => _selectedRole;

  final List<SelectType> selectTypeList = [
    SelectType(
        title: "Atleta",
        english: "Athlete",
        subtitle: "Ottieni piani di allenamento e nutrizione su misura per te.",
        image:
            AssetUtils.selectedRoleAthlete), // Replace with actual AssetUtils
    SelectType(
        title: "Allenatore",
        english: "Coach",
        subtitle: "Gestisci gli atleti e sviluppa la tua carriera da coach.",
        image: AssetUtils.selectedRoleCoach), // Replace with actual AssetUtils
    SelectType(
        title: "Tutor",
        english: "Tutor",
        subtitle: "Eroga corsi e certifica nuovi coach.",
        image: AssetUtils.selectedRoleTutor),
  ];

  void selectRole(
    int index,
    String role,
  ) {
    if (_currentIndex != index) {
      _currentIndex = index;
      _selectedRole = role;
      notifyListeners();
    }
  }

  void onContinuePressed(BuildContext context) {
    if (_currentIndex != null) {
      if (currentIndex == 1) {
        context.read<FlowDataProvider>().addOrUpdateFlow(
          flowTag: customerOnboarding,
          data: {"value": "Coach"},
        );
        Navigator.pushNamedAndRemoveUntil(
            context, RoutePaths.signIn, (route) => false);
      }if (currentIndex == 2) {
        context.read<FlowDataProvider>().addOrUpdateFlow(
          flowTag: customerOnboarding,
          data: {"value": "Tutor"},
        );
        Navigator.pushNamedAndRemoveUntil(
            context, RoutePaths.signIn, (route) => false);
      }  
      
      else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutePaths.signIn, (route) => false);
      }
    }
  }
}

class SelectType {
  final String title;
  final String english;
  final String subtitle;
  final String image;

  SelectType({
    required this.title,
    required this.english,
    required this.subtitle,
    required this.image,
  });
}
