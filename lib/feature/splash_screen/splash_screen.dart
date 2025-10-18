import 'dart:async';

import 'package:ast_official/app_ui_helpers/app_router/app_router.dart';
import 'package:ast_official/feature/on_boarding/walk_through/walk_through.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
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
      goToReplace(context, const WalkThroughScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(color: AppColor.primary),
      child: Center(
        child: SvgPicture.asset(AssetUtils.logoIcon),
      ),
    );
  }
}
