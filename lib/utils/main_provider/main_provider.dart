import 'package:ast_official/data/repository/app_repo.dart';
import 'package:ast_official/data/repository/auth_repo.dart';
import 'package:ast_official/data/repository/onboarding_repo.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/check_in_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/body_measurement/body_measurement_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/checkin_diet/checkin_diet_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/review_your_checkin/review_your_checkin_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/status_feedback/status_feedback_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/home_screen_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/breakfast_time/breakfast_time_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/dinner_time/dinner_time_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/personalize_your_experience/personalize_your_experience_Controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/what_is_your_diet_type/what_is_your_diet_type_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/your_personalized_plan/your_personalized_plan_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_complete/training_complete_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_detail/training_detail_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/training_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_profile/athlete_profile_controller.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/check_in_reviews/check_in_reviews_controller.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/edit_ai_suggestion/edit_ai_suggestion_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/coach_chat_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_edit_profile/coach_edit_profile_controller.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/reset_password/reset_password_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/integration/integration_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/language/language_controller.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans/nutrition_plan/nutrition_plan_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plan_preview/plan_preview_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plans_management/plans_management_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans/trainning_plan/training_plan_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/athlete_subscriptions/athlete_subscriptions_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/payments_royalties_controller.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/transaction_history/transaction_history_controller.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/forgot_password_1/forget_password_controller.dart';
import 'package:ast_official/feature/on_boarding/auth/sign_in/sign_in_controller.dart';
import 'package:ast_official/feature/on_boarding/auth/sign_up/sign_up_controller.dart';
import 'package:ast_official/feature/on_boarding/date_of_birth/date_of_birth_controller.dart';
import 'package:ast_official/feature/on_boarding/otp_view/otp_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/choose_your_plan/choose_your_plan_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/success/success_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/wallet/wallet_controller.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_controller.dart';
import 'package:ast_official/feature/on_boarding/select_gender/select_gender_controller.dart';
import 'package:ast_official/feature/on_boarding/select_objective/select_objective_controller.dart';
import 'package:ast_official/feature/on_boarding/select_role/select_role_controller.dart';
import 'package:ast_official/feature/on_boarding/select_weight/select_weight_controller.dart';
import 'package:ast_official/feature/on_boarding/welcome_screen/welcome_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s1/tutor_certificate_section_s1_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s2/tutor_certificate_section_s2_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s3/tutor_certificate_section_s3_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s4/tutor_certificate_section_s4_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s1/tutor_course_section_s1_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s2/tutor_course_section_s2_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s3/tutor_course_section_s3_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s4/tutor_course_section_s4_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s1/tutor_profile_settings_section_s1_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s2/tutor_profile_settings_section_s2_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s3/tutor_profile_settings_section_s3_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s4/tutor_profile_settings_section_s4_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s1/tutor_submission_section_s1_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s2/tutor_submission_section_s2_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section_controller.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../feature/coach_dashboard/coach_profile_setting/coach_profile_setting_controller.dart';

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
          onboardingRepository: context.read<OnboardingRepo>())),
  ChangeNotifierProvider(create: (context) => SelectRoleController()),
  ChangeNotifierProvider(
      create: (context) => SelectGenderController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(create: (context) => PersonHeightController()),
  ChangeNotifierProvider(
      create: (context) => SelectWeightController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(
      create: (context) =>
          OtpController(authRepoService: context.read<AuthRepoService>())),
  ChangeNotifierProvider(
      create: (context) => DateOfBirthController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(create: (context) => DashboardController()),
  ChangeNotifierProvider(
      create: (context) =>
          SignUpController(authRepoService: context.read<AuthRepoService>())),
  ChangeNotifierProvider(create: (context) => HomeScreenController()),
  ChangeNotifierProvider(
      create: (context) =>
          SignInController(authRepoService: context.read<AuthRepoService>())),
  ChangeNotifierProvider(
      create: (context) => ForgetPasswordController(
          authRepoService: context.read<AuthRepoService>())),
  // ChangeNotifierProvider(
  //     create: (context) => ChangePasswordController(
  //         // authRepoService: context.read<AuthRepoService>()
  //         )),
  ChangeNotifierProvider(create: (context) => HomeScreenController()),
  ChangeNotifierProvider(create: (context) => WhatIsYourDietTypeController()),
  ChangeNotifierProvider(
      create: (context) => WalletController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(
      create: (context) => ChooseYourPlanController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(create: (context) => WelcomeController()),
  ChangeNotifierProvider(create: (context) => SuccessController()),
  ChangeNotifierProvider(
      create: (context) => SelectObjectiveController(
          onboardingRepoService: context.read<OnboardingRepoService>())),
  ChangeNotifierProvider(
      create: (context) => PersonalizYourExperienceController()),
  ChangeNotifierProvider(create: (context) => HomeScreenController()),
  ChangeNotifierProvider(create: (context) => BreakFastTimeController()),
  ChangeNotifierProvider(create: (context) => DinnerTimeController()),
  ChangeNotifierProvider(create: (context) => YourPersonalizedPlanController()),
  ChangeNotifierProvider(create: (context) => WhatIsYourActivityController()),
  ChangeNotifierProvider(create: (context) => DashboardHomeScreenController()),
  ChangeNotifierProvider(create: (context) => TrainingViewController(appRepoService: context.read<AppRepoService>())),
  ChangeNotifierProvider(create: (context) => TrainingDetailController()),
  ChangeNotifierProvider(create: (context) => TrainingCompleteController()),
  ChangeNotifierProvider(create: (context) => AtheletCoachesController()),
  ChangeNotifierProvider(create: (context) => CheckInController()),
  ChangeNotifierProvider(create: (context) => CheckInDietController()),
  ChangeNotifierProvider(create: (context) => BodyMeasurementController()),
  ChangeNotifierProvider(create: (context) => StatusFeedbackController()),
  ChangeNotifierProvider(create: (context) => ReviewYourCheckInController()),
  ChangeNotifierProvider(create: (context) => AtheletChatController()),

  ////////Coaches Dashboard//////

  ChangeNotifierProvider(
    create: (context) => CoachBottomBar(),
  ),
  ChangeNotifierProvider(create: (context) => CoachHomeScreenController()),
  ChangeNotifierProvider(create: (context) => AthleteManagementController()),
  ChangeNotifierProvider(create: (context) => AthleteProfileController()),
  ChangeNotifierProvider(create: (_) => PlansManagementController()),
  ChangeNotifierProvider(create: (_) => FlowDataProvider()),
  ChangeNotifierProvider(create: (_) => PlanPreviewController()),
  ChangeNotifierProvider(create: (_) => TrainingPlanController()),
  ChangeNotifierProvider(create: (_) => NutritionPlanController()),

  ChangeNotifierProvider(
    create: (_) => PaymentsRoyaltiesController(),
  ),

  ChangeNotifierProvider(
    create: (_) => AthleteSubscriptionsController(),
  ),
  ChangeNotifierProvider(
    create: (_) => TransactionsHistoryController(),
  ),

  ChangeNotifierProvider(
    create: (_) => CoachChatController(),
  ),
  ChangeNotifierProvider(
    create: (_) => CoachProfileSettingController(),
  ),

  ChangeNotifierProvider(
    create: (_) => CoachEditProfileController(),
  ),

  ChangeNotifierProvider(
    create: (_) => IntegrationController(),
  ),
  ChangeNotifierProvider(
    create: (_) => LanguageSelectorController(),
  ),

  ChangeNotifierProvider(
    create: (_) => ResetPasswordController(),
  ),

  ChangeNotifierProvider(
    create: (_) => CheckInReviewsController(),
  ),
  ChangeNotifierProvider(
    create: (_) => EditAiSuggestionController(),
  ),

  ////////Tutor Dashboard//////
  ChangeNotifierProvider(create: (context) => TutorHomeScreenController()),

  ChangeNotifierProvider(create: (context) => TutorCourseSectionController()),
  ChangeNotifierProvider(create: (context) => TutorCourseSectionS1Controller()),
  ChangeNotifierProvider(create: (context) => TutorCourseSectionS2Controller()),
  ChangeNotifierProvider(
    create: (context) => TutorBottomBar(),
  ),
  ChangeNotifierProvider(create: (context) => TutorCourseSectionS3Controller()),
  ChangeNotifierProvider(create: (context) => TutorCourseSectionS4Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionController()),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS1Controller()),

  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS2Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS3Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS4Controller()),

  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionController()),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS1Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS2Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS3Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS4Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorSubmissionSectionController()),
  ChangeNotifierProvider(
      create: (context) => TutorSubmissionSectionS1Controller()),
  ChangeNotifierProvider(
      create: (context) => TutorSubmissionSectionS2Controller()),
];
