import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget appBar({
  double? appBarWidth,
  Color appBarColor = AppColor.transparent,
  double borderRadius = 0,

  // elements
  Widget? logo,
  Widget? backButton,
  Widget? crossButton,
  Widget? whatsappButton,
  Widget? menuButton,
  Widget? customSlider,

  // visibility flags
  bool showBackButton = false,
  bool showCrossButton = false,
  bool showMenuButton = false,
  bool showLogo = true,
  bool isLogoCentered = false,
  bool showSlider = false,
  double? appBarMargin,
}) {
  return Container(
    width: appBarWidth ?? 100.w,
    margin: EdgeInsets.only(bottom: appBarMargin ?? 1.2.h),
    padding: EdgeInsets.only(left: 5.8.w, right: 5.8.w, top: 5.h),
    color: appBarColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🔹 Top Row (Buttons + Logo)
        Row(
          mainAxisAlignment: isLogoCentered
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side area
            if (showBackButton && backButton != null)
              backButton
            else if (!isLogoCentered && showLogo && logo != null)
              logo,

            // Centered logo (if required)
            if (isLogoCentered && showLogo && logo != null)
              Expanded(
                child: Center(child: logo),
              )
            else
              const Spacer(),

            // Right side icons (Cross, Menu, WhatsApp)
            Row(
              children: [
                if (showCrossButton && crossButton != null)
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: crossButton,
                  ),
                if (whatsappButton != null)
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: whatsappButton,
                  ),
                if (showMenuButton && menuButton != null)
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: menuButton,
                  ),
              ],
            ),
          ],
        ),

        // 🔹 Custom slider (if any)
        if (showSlider && customSlider != null) ...[
          Align(
            alignment: isLogoCentered ? Alignment.centerLeft : Alignment.center,
            child: customSlider,
          ),
        ],
      ],
    ),
  );
}

Widget customSlider(int totalSegments, int activeSegments, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(totalSegments, (index) {
      bool isActive = index < activeSegments;
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: cw(2)),
          height: ch(4),
          width: cw(10),
          decoration: BoxDecoration(
            color: isActive ? color : AppColor.white.withOpacity(0.35),
            borderRadius: BorderRadius.circular(cw(10)),
          ),
        ),
      );
    }),
  );
}

Widget onboaridngAppBar(
    {required BuildContext context,
    required int activeSegments,
    required int totalSegments,
    VoidCallback? onTap}) {
  return Container(
      padding: EdgeInsets.all(cw(20)),
      height: ch(150),
      decoration: const BoxDecoration(gradient: AppGradients.redGradient),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left logo
          SvgPicture.asset(
            AssetUtils.logoIcon,
            width: cw(60),
            height: ch(25),
          ),

          SizedBox(width: cw(12)),

          Expanded(
            child: customSlider(totalSegments, activeSegments, AppColor.white),
          ),

          SizedBox(width: cw(57)),

          GestureDetector(
            onTap: onTap ??
                () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutePaths.selectRole, (route) => false);
                },
            child: SvgPicture.asset(
              AssetUtils.appCrossIcon,
            ),
          ),
        ],
      ));
}

Widget centerTextBackIconAppbar({
  required BuildContext context,
  required String text,
  bool textIsItalic = false,
  Function? onTap,
}) {
  return Column(
    children: [
      SizedBox(height: ch(20)),
      Row(
        children: [
          // back icon
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap != null ? onTap() : Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // small tap area
              child: SvgPicture.asset(
                AssetUtils.backArrow,
                height: ch(20),
                width: cw(20),
              ),
            ),
          ),

          // center text
          Expanded(
            child: Center(
              child: AppText(
                txt: text,
                fontSize: AppFontSize.f16 + 4,
                isItalic: textIsItalic,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(width: cw(20)),
        ],
      ),
      SizedBox(height: ch(20)),
    ],
  );
}

Widget textProfileSettingAppbar({
  required BuildContext context,
  required String text,
  double? fontSize,
  bool textIsItalic = false,
  bool isNotificationIcon = false,
  bool isAtheletIcon = false,
  bool isNotificationScreen = false,
  bool isAtheletScreen = false,
  Function? onTap,
  bool isNotificationBool = false,
  String? numberOfNotification,
  VoidCallback? notificationOnTap,
  bool isAtheletBool = false,
  VoidCallback? atheletScreenOnTap,
}) {
  return Column(
    children: [
      SizedBox(height: ch(20)),
      Row(
        children: [
          AppText(
            txt: text,
            fontSize: fontSize ?? AppFontSize.f24,
            isItalic: true,
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          if (isAtheletScreen) ...[
            GestureDetector(
              onTap: atheletScreenOnTap ?? () {},
              child: Container(
                height: ch(39),
                width: cw(39),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color:
                            isAtheletBool ? AppColor.red : AppColor.c252525)),
                child: Center(
                  child: Container(
                      height: ch(34),
                      width: cw(34),
                      decoration: BoxDecoration(
                        color: isAtheletBool
                            ? AppColor.red.withValues(alpha: 0.1)
                            : AppColor.c252525,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AssetUtils.coachBottombar2,
                          height: ch(20),
                          width: cw(20),
                          fit: BoxFit.contain,
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              width: cw(20),
            ),
          ],
          if (isNotificationIcon) ...[
            GestureDetector(
              onTap: notificationOnTap ?? () {},
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: ch(39),
                    width: cw(39),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: isNotificationBool
                                ? AppColor.red
                                : AppColor.c252525)),
                    child: Center(
                      child: Container(
                        height: ch(34),
                        width: cw(34),
                        decoration: BoxDecoration(
                          color: isNotificationBool
                              ? AppColor.red.withValues(alpha: 0.1)
                              : AppColor.c252525,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          gradient: AppGradients.redGradient),
                      // constraints: const BoxConstraints(
                      //   minWidth: 16,
                      //   minHeight: 16,
                      // ),
                      child: Center(
                        child: Text(
                          numberOfNotification ?? '14',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: cw(20),
            ),
          ],
          GestureDetector(
            onTap: () =>
                onTap ??
                Navigator.pushNamed(
                    context, RoutePaths.coachProfileSettingScreen),
            child: SvgPicture.asset(
              AssetUtils.profileIcon,
              height: ch(40),
            ),
          )
        ],
      ),
      SizedBox(height: ch(20)),
    ],
  );
}
