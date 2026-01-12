// ignore_for_file: unused_local_variable

import 'package:ast_official/app_ui_helpers/app_routes/app_routes.dart';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/generated/l10n.dart';
import 'package:ast_official/services/notification_service/app_notification_service.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/main_provider/main_provider.dart';
import 'package:ast_official/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:ast_official/services/connectivity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ MUST BE FIRST

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppNotificationService notificationService = AppNotificationService();

  runApp(
    MultiProvider(
      providers: providersList,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late ConnectivityService _connectivityService;

  @override
  void initState() {
    super.initState();
    _connectivityService = ConnectivityService(_scaffoldMessengerKey);
    _connectivityService.initialize();
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

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
        scaffoldMessengerKey: _scaffoldMessengerKey,
        locale: null, // 👈 AUTO detect (English / Spanish)
        // supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        title: 'AST®️ Official App',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // home: const PaymentsRoyaltiesView(),
        initialRoute: RoutePaths.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
      );
    });
  }
}
