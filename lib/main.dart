import 'package:ast_official/feature/splash_screen/splash_screen.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  //Uncomment it when you create providers
  // runApp(MultiProvider(providers: [
  // ChangeNotifierProvider(create: (context) => CounterProvider()),
  // ], child:  MyApp(),));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.black,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
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
        home: const SplashScreen(),
      );
    });
  }
}
