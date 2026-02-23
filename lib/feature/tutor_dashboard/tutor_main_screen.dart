import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_view.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section_controller.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorMainScreen extends StatefulWidget {
  const TutorMainScreen({super.key});

  @override
  State<TutorMainScreen> createState() => _TutorMainScreenState();
}

class _TutorMainScreenState extends State<TutorMainScreen> {
  late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      ChangeNotifierProvider(
        create: (_) => TutorHomeScreenController(),
        child: const TutorHomeScreenView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TutorCourseSectionController(),
        child: const TutorCourseSectionView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TutorSubmissionSectionController(),
        child: const TutorSubmissionSectionView(),
      ),
      ChangeNotifierProvider(
        create: (context) => TutorCertificateSectionController(
          appRepoService: context.read<AppRepoService>(),
        ),
        child: const TutorCertificateSectionView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TutorProfileSettingsSectionController(),
        child: const TutorProfileSettingsSectionView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TutorBottomBar(),
      child: Scaffold(
        body: Consumer<TutorBottomBar>(
          builder: (context, model, child) {
            return PageView(
              controller: model.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => model.setSelectedIndex(index),
              children: screenList,
            );
          },
        ),
        bottomNavigationBar: tutorBottomBar(),
      ),
    );
  }
}
