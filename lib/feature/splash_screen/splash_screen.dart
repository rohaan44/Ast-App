import 'dart:async';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, RoutePaths.walkthrough, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(gradient: AppGradients.redGradient),
      child: Center(
        child: SvgPicture.asset(AssetUtils.logoIcon),
      ),
    );
  }
}
