
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
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
            if (showBackButton && backButton != null) backButton
            else if (!isLogoCentered && showLogo && logo != null) logo,

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
            alignment:
                isLogoCentered ? Alignment.centerLeft : Alignment.center,
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
          width: cw(30),
          decoration: BoxDecoration(
            color: isActive ? color : AppColor.white.withOpacity(0.35),
            borderRadius: BorderRadius.circular(cw(10)),
          ),
        ),
      );
    }),
  );
}