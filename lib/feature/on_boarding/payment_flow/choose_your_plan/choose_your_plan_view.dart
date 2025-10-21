import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/app_divider.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseYourPlanView extends StatelessWidget {
  const ChooseYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AssetUtils.walkthroughIcon),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(AssetUtils.appCrossIcon),
                  )
                ],
              ),
              SizedBox(
                height: ch(30),
              ),
              AppText(
                txt: "Scegli il tuo piano",
                fontSize: AppFontSize.f24,
                fontWeight: FontWeight.w500,
                color: AppColor.cFFFFFF,
                height: 1,
              ),
              SizedBox(
                height: ch(8),
              ),
              AppText(
                txt:
                    "Atleti che utilizzano l’app per allenamento e nutrizione.",
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w400,
                color: AppColor.cFFFFFF.withOpacity(0.5),
                height: 1.5,
              ),
              SizedBox(
                height: ch(40),
              ),
              isCheckItems("Accesso ai piani di allenamento e nutrizione"),
              SizedBox(
                height: ch(15),
              ),
              isCheckItems("Check-in intelligente settimanale"),
              SizedBox(
                height: ch(15),
              ),
              isCheckItems("Integrazione con Apple Health/Google Fit"),
              SizedBox(
                height: ch(15),
              ),
              isCheckItems("Chat limitata con l’allenatore (solo testo)"),
              SizedBox(
                height: ch(40),
              ),
              appDivider(),
              SizedBox(
                height: ch(30),
              ),

              plainCard("Piano Base", "€79/mese", "Mese"),

              const Spacer(),
              AppButton(onPressed: (){
                Navigator.pushNamed(context, RoutePaths.walletView);
              },text: "Scegli il piano",),
              SizedBox(height: ch(10),)
            ],
          ),
        ),
      ),
    );
  }
}

Widget isCheckItems(String text) {
  return Row(
    children: [
      SvgPicture.asset(AssetUtils.greenCheckOutlined),
      SizedBox(
        width: cw(8),
      ),
      AppText(
        txt: text,
        fontSize: AppFontSize.f16,
        fontWeight: FontWeight.normal,
        color: AppColor.white,
      )
    ],
  );
}

Widget plainCard(String title, String priceText, String subtitle) {
  return Container(
    margin: const EdgeInsets.only(top: 24.0),
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: AppColor.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(cw(16.0)),
      border: Border.all(color: AppColor.c454545, width: 2.0),
    ),
    child: Row(
      children: [
        // Text section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                txt: "$title - $priceText",
                fontSize: AppFontSize.f18,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
               SizedBox(height: ch(4)),
              AppText(
                txt: subtitle,
                fontSize: AppFontSize.f15,
                fontWeight: FontWeight.normal,
                color: AppColor.white,
              ),
            ],
          ),
        ),

        Radio<bool>(
          activeColor: AppColor.white,
          value: true, groupValue: true, 
          onChanged: (value){})
      ],
    ),
  );
}


