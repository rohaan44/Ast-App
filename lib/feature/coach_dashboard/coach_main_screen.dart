import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_view.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachMainScreen extends StatelessWidget {
  const CoachMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final model = Provider.of<CoachBottomBar>(context);

    return Scaffold(
      bottomNavigationBar: coachBottomBar(),
      body: PageView(
      onPageChanged: (index) => model.setSelectedIndex(index),
      controller: model.pageController,
      children: const[
        CoachHomeScreenView(),
        AthleteManagementView()
      ],
      ),
    );
  }
}