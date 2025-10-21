import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
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
import 'package:ast_official/feature/on_boarding/sign_in/sign_in_view.dart';
import 'package:ast_official/feature/on_boarding/walk_through/walk_through_view.dart';
import 'package:ast_official/feature/splash_screen/splash_screen.dart';
import 'package:ast_official/feature/welcome_screen/welcome_view.dart';
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
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
