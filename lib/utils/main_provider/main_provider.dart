import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/home_screen/home_screen_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/home_screen/sub_screen/personalize_your_experience/personalize_your_experience_Controller.dart';
import 'package:ast_official/feature/athelete_dashboard/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/home_screen/sub_screen/what_is_your_diet_type/what_is_your_diet_type_controller.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_controller.dart';
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
import 'package:ast_official/feature/on_boarding/sign_in/sign_in_controller.dart';
import 'package:ast_official/feature/on_boarding/welcome_screen/welcome_controller.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  ChangeNotifierProvider(create: (context) => SelectRoleController()),
  ChangeNotifierProvider(create: (context) => SelectGenderController()),
  ChangeNotifierProvider(create: (context) => PersonHeightController()),
  ChangeNotifierProvider(create: (context) => SelectWeightController()),
  ChangeNotifierProvider(create: (context) => OtpController()),
  ChangeNotifierProvider(create: (context) => DateOfBirthController()),
  ChangeNotifierProvider(create: (context) => DashboardController()),
  ChangeNotifierProvider(create: (context) => SignInController()),
  ChangeNotifierProvider(create: (context) => HomeScreenController()),
  ChangeNotifierProvider(create: (context) => WhatIsYourDietTypeController()),
  
  ChangeNotifierProvider(create: (context) => WalletController()),
  
  ChangeNotifierProvider(create: (context) => ChooseYourPlanController()),
    ChangeNotifierProvider(create: (context) => WelcomeController()),
  ChangeNotifierProvider(create: (context) => SuccessController()),
ChangeNotifierProvider(create: (context) => SelectObjectiveController()),
  ChangeNotifierProvider(
      create: (context) => PersonalizYourExperienceController()),
  ChangeNotifierProvider(create: (context) => HomeScreenController()),
  ChangeNotifierProvider(create: (context) => WhatIsYourActivityController()),


  ////////Coaches Dashboard//////
  ChangeNotifierProvider(create: (context) => CoachHomeScreenController()),
    ChangeNotifierProvider(
      create: (context) => CoachBottomBar(),
    ),
];
