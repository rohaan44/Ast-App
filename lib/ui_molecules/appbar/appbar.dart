
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


Widget onboaridngAppBar({required BuildContext context,required int activeSegments, required int totalSegments}){return 


            Container(
              padding: EdgeInsets.all(cw(20)),
              height: ch(150),
              decoration: const BoxDecoration(gradient: AppGradients.redGradient),
              child:Row(
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
      onTap: (){
        Navigator.pushNamedAndRemoveUntil(context, RoutePaths.selectRole, (route) => false);
      },
      child: SvgPicture.asset(
        AssetUtils.appCrossIcon,
      ),
    ),
  ],
)

            );}