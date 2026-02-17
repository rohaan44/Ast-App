import 'package:ast_official/data/repository/app_repo.dart';
import 'package:ast_official/data/repository/auth_repo.dart';
import 'package:ast_official/data/repository/onboarding_repo.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/your_personalized_plan/your_personalized_plan_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_profile/athlete_profile_controller.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/check_in_reviews/check_in_reviews_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/coach_chat_controller.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_controller.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/reset_password/reset_password_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section_controller.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plans_management/plans_management_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  Provider<AuthRepository>(
    create: (context) => AuthRepository(),
  ),
  Provider<AppRepo>(
    create: (context) => AppRepo(),
  ),
  Provider<OnboardingRepo>(
    create: (context) => OnboardingRepo(),
  ),
  Provider<AppRepoService>(
    create: (context) => AppRepoService(
      appRepo: context.read<AppRepo>(),
    ),
  ),
  Provider<AuthRepoService>(
    create: (context) => AuthRepoService(
      authRepository: context.read<AuthRepository>(),
    ),
  ),
  Provider<OnboardingRepoService>(
    create: (context) => OnboardingRepoService(
        onboardingRepository: context.read<OnboardingRepo>()),
  ),

  ChangeNotifierProvider(
      create: (context) => DashboardController(), lazy: true),

  ChangeNotifierProvider(
      create: (context) => YourPersonalizedPlanController(), lazy: true),

  ////////Coaches Dashboard//////

  ChangeNotifierProvider(
    create: (context) => CoachBottomBar(),
  ),

  ChangeNotifierProvider(
    create: (context) => AthleteProfileController(),
    lazy: true,
  ),
  ChangeNotifierProvider(
    create: (_) => FlowDataProvider(),
  ),

  ChangeNotifierProvider(
    create: (_) => CoachChatController(),
  ),
  ChangeNotifierProvider(
    lazy: true,
    create: (context) => CoachHomeScreenController(
      appRepoService: context.read<AppRepoService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (_) => AtheletChatController(),
  ),
  ChangeNotifierProvider(
    create: (context) => AthleteManagementController(
      appRepoService: context.read<AppRepoService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => PlansManagementController(),
  ),

  ChangeNotifierProvider(
    create: (context) => ResetPasswordController(
        authRepoService: context.read<AuthRepoService>()),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => CheckInReviewsController(),
  ),

  ////////Tutor Dashboard//////
  ChangeNotifierProvider(
    create: (context) => TutorHomeScreenController(),
  ),

  ChangeNotifierProvider(
    create: (context) => TutorCourseSectionController(),
  ),
  ChangeNotifierProvider(
    create: (context) => TutorBottomBar(),
    lazy: true,
  ),
  ChangeNotifierProvider(
    create: (context) => TutorProfileSettingsSectionController(),
  ),
  ChangeNotifierProvider(
    create: (context) => TutorCertificateSectionController(),
  ),
  ChangeNotifierProvider(
    create: (context) => TutorSubmissionSectionController(),
  ),
];
