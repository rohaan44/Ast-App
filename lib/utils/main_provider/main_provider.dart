import 'package:ast_official/data/repository/app_repo.dart';
import 'package:ast_official/data/repository/auth_repo.dart';
import 'package:ast_official/data/repository/onboarding_repo.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/domain/repository/auth_repo_service.dart';
import 'package:ast_official/domain/repository/onboarding_repo_service.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_Info/athlete_info_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_edit_profile/athlete_edit_profile_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_integration/athlete_integration_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_language/athlete_language_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_profile_setting_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_renew_certificate/athlete_renew_certificate_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/coach_profile/coach_profile_controller.dart';
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
    //lazy: true,
  ),
  Provider<AppRepo>(
    create: (context) => AppRepo(),
    // lazy: true,
  ),
  Provider<OnboardingRepo>(
    create: (context) => OnboardingRepo(),
    // lazy: true,
  ),
  Provider<AppRepoService>(
    create: (context) => AppRepoService(
      appRepo: context.read<AppRepo>(),
    ),
    //  lazy: true,
  ),
  Provider<AuthRepoService>(
    create: (context) => AuthRepoService(
      authRepository: context.read<AuthRepository>(),
    ),
    //lazy: true,
  ),
  Provider<OnboardingRepoService>(
    create: (context) => OnboardingRepoService(
        onboardingRepository: context.read<OnboardingRepo>()),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => SelectRoleController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => SelectGenderController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => PersonHeightController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => SelectWeightController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
    create: (context) =>
        OtpController(authRepoService: context.read<AuthRepoService>()),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => DateOfBirthController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => DashboardController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) =>
          SignUpController(authRepoService: context.read<AuthRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => HomeScreenController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) =>
          SignInController(authRepoService: context.read<AuthRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => ForgetPasswordController(
          authRepoService: context.read<AuthRepoService>()),
      lazy: true),
  // ChangeNotifierProvider(
  //     create: (context) => ChangePasswordController(
  //         // authRepoService: context.read<AuthRepoService>()
  //         )),
  ChangeNotifierProvider(
      create: (context) => HomeScreenController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => WhatIsYourDietTypeController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => WalletController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => ChooseYourPlanController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(create: (context) => WelcomeController(), lazy: true),
  ChangeNotifierProvider(create: (context) => SuccessController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => SelectObjectiveController(
          onboardingRepoService: context.read<OnboardingRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => PersonalizYourExperienceController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => HomeScreenController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => BreakFastTimeController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => DinnerTimeController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => YourPersonalizedPlanController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => WhatIsYourActivityController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => DashboardHomeScreenController(
          appRepoService: context.read<AppRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => TrainingViewController(
          appRepoService: context.read<AppRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => TrainingDetailController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TrainingCompleteController(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => AtheletCoachesController(
        appRepoService: context.read<AppRepoService>()),
    // lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => CoachProfileController(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => CheckInController(),
    // lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => CheckInDietController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => BodyMeasurementController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => StatusFeedbackController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => ReviewYourCheckInController(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => AtheletChatController(),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => AthleteEditProfileController(
          appRepoService: context.read<AppRepoService>()),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => AthleteInfoController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => AthleteIntegrationController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => AthleteLanguageController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => AthleteRenewCertificateController(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => AthleteProfileSettingController(
          authRepoService: context.read<AuthRepoService>()),
      lazy: true),
  ////////Coaches Dashboard//////

  ChangeNotifierProvider(
    create: (context) => CoachBottomBar(),
    //lazy: true,
  ),
  ChangeNotifierProvider(
    create: (context) => CoachHomeScreenController(),
    //lazy: true,
  ),
  ChangeNotifierProvider(
    create: (context) => AthleteManagementController(),
    //lazy: true,
  ),
  ChangeNotifierProvider(
    create: (context) => AthleteProfileController(),
    lazy: true,
  ),
  ChangeNotifierProvider(
      create: (_) => PlansManagementController(), lazy: true),
  ChangeNotifierProvider(
    create: (_) => FlowDataProvider(),
  ),
  ChangeNotifierProvider(create: (_) => PlanPreviewController(), lazy: true),
  ChangeNotifierProvider(create: (_) => TrainingPlanController(), lazy: true),
  ChangeNotifierProvider(create: (_) => NutritionPlanController(), lazy: true),

  ChangeNotifierProvider(
    create: (_) => PaymentsRoyaltiesController(),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => AthleteSubscriptionsController(),
    lazy: true,
  ),
  ChangeNotifierProvider(
    create: (_) => TransactionsHistoryController(),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => CoachChatController(),
    // lazy: true,
  ),
  ChangeNotifierProvider(
    create: (_) => CoachProfileSettingController(),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => CoachEditProfileController(),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => IntegrationController(),
    lazy: true,
  ),
  ChangeNotifierProvider(
    create: (_) => LanguageSelectorController(),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (context) => ResetPasswordController(
        authRepoService: context.read<AuthRepoService>()),
    lazy: true,
  ),

  ChangeNotifierProvider(
    create: (_) => CheckInReviewsController(),
    // lazy: true,
  ),
  ChangeNotifierProvider(
    create: (_) => EditAiSuggestionController(),
    lazy: true,
  ),

  ////////Tutor Dashboard//////
  ChangeNotifierProvider(
    create: (context) => TutorHomeScreenController(),
    //lazy: true
  ),

  ChangeNotifierProvider(
    create: (context) => TutorCourseSectionController(),
    // lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => TutorCourseSectionS1Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorCourseSectionS2Controller(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => TutorBottomBar(),
    lazy: true,
  ),
  ChangeNotifierProvider(
      create: (context) => TutorCourseSectionS3Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorCourseSectionS4Controller(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => TutorProfileSettingsSectionController(),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS1Controller(),
      lazy: true),

  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS2Controller(),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS3Controller(),
      lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorProfileSettingsSectionS4Controller(),
      lazy: true),

  ChangeNotifierProvider(
    create: (context) => TutorCertificateSectionController(),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS1Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS2Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS3Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorCertificateSectionS4Controller(), lazy: true),
  ChangeNotifierProvider(
    create: (context) => TutorSubmissionSectionController(),
    //lazy: true
  ),
  ChangeNotifierProvider(
      create: (context) => TutorSubmissionSectionS1Controller(), lazy: true),
  ChangeNotifierProvider(
      create: (context) => TutorSubmissionSectionS2Controller(), lazy: true),
];
