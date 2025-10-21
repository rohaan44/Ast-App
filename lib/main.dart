import 'package:ast_official/app_ui_helpers/app_routes/app_routes.dart';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/date_of_birth/date_of_birth_controller.dart';
import 'package:ast_official/feature/on_boarding/otp_view/otp_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/choose_your_plan/choose_your_plan_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/success/success_controller.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/wallet/wallet_controller.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_controller.dart';
import 'package:ast_official/feature/on_boarding/select_objective/select_objective_controller.dart';
import 'package:ast_official/feature/on_boarding/select_role/select_role_controller.dart';
import 'package:ast_official/feature/on_boarding/select_gender/select_gender_controller.dart';
import 'package:ast_official/feature/on_boarding/select_weight/select_weight_controller.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  //Uncomment it when you create providers
  runApp(
    MultiProvider(providers: [
  ChangeNotifierProvider(create: (context) => SelectRoleController()),
    ChangeNotifierProvider(create: (context) => SelectGenderController()),
      ChangeNotifierProvider(create: (context) => PersonHeightController()),
      ChangeNotifierProvider(create: (context) => SelectWeightController()),
      
      ChangeNotifierProvider(create: (context) => OtpController()),
      
      ChangeNotifierProvider(create: (context) => DateOfBirthController()),
      
      ChangeNotifierProvider(create: (context) => SelectObjectiveController()),
      
      ChangeNotifierProvider(create: (context) => ChooseYourPlanController()),
      
      ChangeNotifierProvider(create: (context) => WalletController()),
      ChangeNotifierProvider(create: (context) => SuccessController()),
  ], child: const MyApp(),));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.black,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'AST®️ Official App',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        //home: WelcomeView(),
        initialRoute: RoutePaths.splashScreen,
       onGenerateRoute: AppRouter.generateRoute,
      );
    });
  }
}
