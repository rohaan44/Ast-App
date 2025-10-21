import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: ch(60),
          ),
          Center(
              child: SafeArea(
                  child: SvgPicture.asset(
            AssetUtils.walkthroughIcon,
            width: cw(60),
          ))),
          SizedBox(
            height: ch(30),
          ),
          AppText(
            txt: "Benvenuto in A.S.T.®",
            fontSize: AppFontSize.f24,
            color: AppColor.white,
          ),
          SizedBox(
            height: ch(10),
          ),
          AppText(
            txt:
                "Il tuo primo piano ti sta aspettando.\nMancano solo un passo.",
            fontSize: AppFontSize.f16,
            color: AppColor.white.withOpacity(0.5),
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
          ),
          ListTile(
            leading: sideIcon(AssetUtils.welcomeScreenIcon1),
            title: AppText(
              txt: "Allenati in modo più intelligente",
              fontSize: AppFontSize.f16,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AppText(
                txt:
                    "Piani basati su AI e monitoraggio settimanale dei\nprogressi.",
                color: AppColor.white.withOpacity(0.5),
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(
            height: ch(30),
          ),
          ListTile(
            leading: sideIcon(AssetUtils.welcomeScreenIcon3),
            title: AppText(
              txt: "Impara e certificati",
              fontSize: AppFontSize.f16,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AppText(
                txt: "Accademia online con corsi, esami e badge digitali.",
                color: AppColor.white.withOpacity(0.5),
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(
            height: ch(30),
          ),
          ListTile(
            leading: sideIcon(AssetUtils.welcomeScreenIcon2),
            title: AppText(
              txt: "Gestisci e cresci",
              fontSize: AppFontSize.f16,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AppText(
                txt:
                    "Pagamenti sicuri, royalties e approfondimenti sulle performance.",
                color: AppColor.white.withOpacity(0.5),
                fontSize: 13.sp,
              ),
            ),
          ),
          const Spacer(),
          AppButton(
            // isButtonEnable: isEnbleBtn,
            borderRadius: cw(50),
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(context, RoutePaths.otpView, (route) => false);
            },
            buttonColor: AppColor.cFFFFFF,
            text: "Procedi",
            fontWeight: FontWeight.w600,
            textColor: AppColor.black,
          ),
            SizedBox(height: ch(70),),
        ],
      ),
    );
  }
}

Widget sideIcon(String asset) {
  return Container(
      height: ch(50),
      width: cw(50),
      decoration: BoxDecoration(
          color: AppColor.c161616.withOpacity(0.20),
          border: Border.all(
            color: AppColor.c231F20,
          ),
          borderRadius: BorderRadius.circular(cw(16))),
      child: Center(
        child: SvgPicture.asset(asset),
      ));
}
