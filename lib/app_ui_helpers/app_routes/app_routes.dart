import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/dashboard/dashboard_view.dart';
import 'package:ast_official/feature/home_screen/home_screen_view.dart';
import 'package:ast_official/feature/home_screen/sub_screen/personalize_your_experience/personalize_your_experience_view.dart';
import 'package:ast_official/feature/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_view.dart';
import 'package:ast_official/feature/home_screen/sub_screen/what_is_your_diet_type/what_is_your_diet_type_view.dart';
import 'package:ast_official/feature/on_boarding/date_of_birth/date_of_birth_view.dart';
import 'package:ast_official/feature/on_boarding/otp_view/otp_view.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_view.dart';
import 'package:ast_official/feature/on_boarding/select_role/select_role_view.dart';
import 'package:ast_official/feature/on_boarding/select_gender/select_gender_view.dart';
import 'package:ast_official/feature/on_boarding/select_weight/select_weight_view.dart';
import 'package:ast_official/feature/on_boarding/sign_in/sign_in_view.dart';
import 'package:ast_official/feature/on_boarding/walk_through/walk_through_view.dart';
import 'package:ast_official/feature/splash_screen/splash_screen.dart';
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
      case RoutePaths.signIn:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SignInView();
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

      case RoutePaths.dashboardView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const DashboardView();
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
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
