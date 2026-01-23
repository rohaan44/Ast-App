import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/coach_profile/coach_profile_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_Info/athlete_info_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_edit_profile/athlete_edit_profile_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_integration/athlete_integration_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_language/athlete_language_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_profile_setting_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_renew_certificate/athlete_renew_certificate_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/body_measurement/body_measurement_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/checkin_diet/checkin_diet_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/review_your_checkin/review_your_checkin_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/status_feedback/status_feedback_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/home_screen_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/breakfast_time/breakfast_time_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/dinner_time/dinner_time_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/personalize_your_experience/personalize_your_experience_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/what_is_your_diet_type/what_is_your_diet_type_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/your_personalized_plan/your_personalized_plan_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_complete/training_complete.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_detail/training_detail_view.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_view.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_profile/athelete_profile_view.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/edit_ai_suggestion/edit_ai_suggestion_view.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/seleted_check_in/selected_check_in_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/selected_chat/selected_chat_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_main_screen.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_Info/coach_info_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_edit_profile/coach_edit_profile_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_profile_setting_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_renew_certificate/coach_renew_certificate_view.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/reset_password/reset_password_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/integration/integration_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/language/language_view.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/notification/notification_screen.dart';
import 'package:ast_official/feature/coach_dashboard/plans/nutrition_plan/nutrition_plan_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plan_preview/plan_preview_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plans_management/plans_management_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/trainning_plan/training_plan_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/athlete_subscriptions/athlete_subscriptions_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/payments_royalties_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/transaction_history/transaction_history_view.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/forgot_password_1/forget_password_view.dart';
import 'package:ast_official/feature/on_boarding/auth/sign_in/sign_in_view.dart';
import 'package:ast_official/feature/on_boarding/auth/sign_up/sign_up_view.dart';
import 'package:ast_official/feature/on_boarding/date_of_birth/date_of_birth_view.dart';
import 'package:ast_official/feature/on_boarding/otp_view/otp_view.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/choose_your_plan/choose_your_plan_view.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/success/success_view.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/wallet/wallet_view.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_view.dart';
import 'package:ast_official/feature/on_boarding/select_objective/select_objective_view.dart';
import 'package:ast_official/feature/on_boarding/select_role/select_role_view.dart';
import 'package:ast_official/feature/on_boarding/select_gender/select_gender_view.dart';
import 'package:ast_official/feature/on_boarding/select_weight/select_weight_view.dart';
import 'package:ast_official/feature/on_boarding/walk_through/walk_through_view.dart';
import 'package:ast_official/feature/splash_screen/splash_screen.dart';
import 'package:ast_official/feature/on_boarding/welcome_screen/welcome_view.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_main_screen.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s1/tutor_certificate_section_s1.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s2/tutor_certificate_section_s2.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s3/tutor_certificate_section_s3.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s4/tutor_certificate_section_s4.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s1/tutor_course_section_s1.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s2/tutor_course_section_s2.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s3/tutor_course_section_s3.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s4/tutor_course_section_s4.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/sub_screens/tutor_course_section_s5/tutor_course_section_s5.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s1/tutor_profile_settings_section_s1.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s2/tutor_profile_settings_section_s2.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s3/tutor_profile_settings_section_s3.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s4/tutor_profile_settings_section_s4.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s1/tutor_submission_section_s1.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s2/tutor_submission_section_s2.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Walkthrougn screens
      case RoutePaths.walkthrough:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const WalkThroughScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.splashScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SplashScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.selectRole:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectRoleView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.signUp:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SignUpView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.signIn:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SignInView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.forgetPassword:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ForgetPasswordView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.selectGender:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectGenderView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.personHeight:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PersonHeightView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.otpView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const OtpView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.selectWeight:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectWeightView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.dateOfBirth:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const DateOfBirthView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.selectObjective:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectObjectiveView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.welcomeView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const WelcomeView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.chooseYourPlan:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ChooseYourPlanView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.walletView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const WalletView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.successView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SuccessView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.dashboardView:
        final firstPage = settings.arguments as Widget?; // optional argument

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return DashboardView(
              firstPage: firstPage,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.homeScreenView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeScreenview();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.personalizeYourExperienceView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PersonalizYourExperience();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.whatIsYourActivityView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const WhatIsYourActivity();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.whatIsYourDietTypeView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const WhatIsYourDietTypeView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.breakFastTimeView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const BreakFastTimeView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.dinnerTimeView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const DinnerTimeView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.yourPersonalizedPlanView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const YourPersonalizedPlanView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.dashboardHomeScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const DashboardHomeScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.athleteLanguageSelectedScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteLanguageView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteInfoScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteInfoView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteIntegrationScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteIntegrationView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteRenewCertificateScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthletehRenewCertificationView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteProfileSetting:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteProfileSettingView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteEditProfile:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteEditProfileView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.trainingDetailViw:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final args = settings.arguments as Map?;

            return TrainingDetailView(
              title: args?["title"] ?? "",
              subTitle: args?["subTitle"],
              difficultyLevel: args?["difficultyLevel"],
              cardImg: args?["cardImg"],
              date: args?["date"],
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      /////////////////////////////Coach Dashboard//////////////////////////
      case RoutePaths.coachMainScreenView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachMainScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.coachHomeScreenView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachHomeScreenView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.notificationScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const NotificationScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.planPreviewScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PlanPreviewView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.trainingPlanScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TrainingPlanView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.plansManagementScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PlansManagementView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.nutritionPlanScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const NutritionPlanView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.plansRoyaltiesScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PaymentsRoyaltiesView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.transactionHistoryScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TransactionsHistoryView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.athleteSubscriptionsScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteSubscriptionsView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.selectedChatScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectedChatView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.coachProfileSettingScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachProfileSettingView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteManagementView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteManagementView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.coachEditProfileView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachEditProfileView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.coachInfoView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachInfoView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.coachRenewCertificationView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachRenewCertificationView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.integrationScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const IntegrationView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.languageSelectedScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LanguageView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      // case RoutePaths.resetPasswordEmailScreen:
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) {
      //       return const ResetPasswordEmailView();
      //     },
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return child;
      //     },
      //   );

      case RoutePaths.resetPasswordScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ResetPasswordView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.selectedCheckInScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SelectedCheckInView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.editCheckInScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const EditAiSuggestionView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
//////// Tutor Profile Settings
      case RoutePaths.tutorCourseSectionView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.tutorMainScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorMainScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.tutorCourseSectionS1View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionS1View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCourseSectionS2View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionS2View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCourseSectionS3View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionS3View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCourseSectionS4View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionS4View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCourseSectionS5View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCourseSectionS5View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCertificateSectionView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCertificateSectionView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCertificateSectionS1View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCertificateSectionS1View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCertificateSectionS2View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCertificateSectionS2View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCertificateSectionS3View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCertificateSectionS3View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorCertificateSectionS4View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorCertificateSectionS4View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.athleteProfileView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteProfileView(
              athlete: null,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorSubmissionSectionView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorSubmissionSectionView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorSubmissionSectionS1View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorSubmissionSectionS1View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorSubmissionSectionS2View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorSubmissionSectionS2View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorProfileSettingsSectionView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorProfileSettingsSectionView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorProfileSettingsSectionS1View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorProfileSettingsSectionS1View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorProfileSettingsSectionS2View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorProfileSettingsSectionS2View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.tutorProfileSettingsSectionS3View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorProfileSettingsSectionS3View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.tutorProfileSettingsSectionS4View:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TutorProfileSettingsSectionS4View();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.trainingComplete:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TrainingComplete();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

      case RoutePaths.checkInDietView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CheckInDietView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.bodyMeasurementView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const BodyMeasurementView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.statusFeedbackView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const StatusFeedbackView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.reviewYourCheckInView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ReviewYourCheckInView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.atheletCoachesView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AtheletCoachesView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.coachProfileView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CoachProfileView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.trainingPlanView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const TrainingPlanView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      case RoutePaths.atheletManagementView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AthleteManagementView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
