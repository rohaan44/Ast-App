import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/asset_utils.dart';

class FoodSubstitutionView extends StatelessWidget {
  final Map<String, dynamic> mealData; // e.g., controller.selectedMeal
  const FoodSubstitutionView({super.key, required this.mealData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: cw(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Main meal header
          AppText(
            txt: mealData["title"] ?? "Pranzo",
            fontSize: AppFontSize.f18 + 2,
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
          SizedBox(height: ch(16)),
      
          // 🔹 Current food section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    // padding: EdgeInsets.all(cw(10)),
                    decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(
                      AssetUtils.snackIcon, // replace with correct icon
                      height: ch(18),
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(width: cw(10)),
                  AppText(
                    txt: mealData["current"]?["name"] ??
                        "Insalata Di Pollo\n Alla Griglia",
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.f16,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(
                    txt: mealData["current"]?["alt"] ??
                        "Green Yogurt + Berries",
                    color: AppColor.white,
                    fontSize: AppFontSize.f15,
                  ),
                  AppText(
                    txt: "${mealData["current"]?["macros"]}",
                    color: AppColor.white.withOpacity(0.7),
                    fontSize: AppFontSize.f14,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: ch(20)),
      
          // 🔹 Alternative options
          ...List.generate(mealData["alternatives"].length, (index) {
            final alt = mealData["alternatives"][index];
            return Container(
              margin: EdgeInsets.only(bottom: ch(12)),
              padding: EdgeInsets.all(cw(14)),
              decoration: BoxDecoration(
                color: AppColor.c252525,
                borderRadius: BorderRadius.circular(cw(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: cw(40),
                        height: ch(40),
                        padding: EdgeInsets.all(cw(10)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SvgPicture.asset(
                          alt["icon"],
                          height: ch(18),
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(width: cw(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            txt: alt["name"],
                            fontSize: AppFontSize.f16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                          SizedBox(height: ch(4)),
                          AppText(
                            txt: alt["macros"],
                            fontSize: AppFontSize.f14 + 1,
                            color: AppColor.white.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppButton(
                    text: "Scambio",
                    width: cw(70),
                    fontSize: AppFontSize.f15,
                    height: ch(30),
                    textColor: AppColor.white,
                    buttonColor: AppColor.red,
                    onPressed: () {
                      // Handle swap logic here
                    },
                  ),
                ],
              ),
            );
          }),
      
          SizedBox(height: ch(20)),
      
          // 🔹 Quick substitute chips
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(mealData["quickSubs"].length, (i) {
              final q = mealData["quickSubs"][i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: cw(85),
                    height: cw(85),
                    decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: SvgPicture.asset(q["icon"], height: ch(24)),
                    ),
                  ),
                  SizedBox(height: ch(6)),
                  AppText(
                    txt: q["name"],
                    color: AppColor.white,
                    fontSize: AppFontSize.f15,
                  ),
                ],
              );
            }),
          ),
      
          SizedBox(height: ch(25)),
      
          // 🔹 Bottom action buttons
          AppButton(
            text: "Salva modifiche",
            onPressed: () {},
            textColor: AppColor.black,
            buttonColor: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: ch(10)),
          AppButton(
            text: "Ripristina il piano AI",
            onPressed: () {},
            isBorder: true,
            borderColor: AppColor.c333333,
            borderWidth: 1.5,
            buttonColor: AppColor.transparent,
            textColor: AppColor.white,
          ),
        ],
      ),
    );
  }
}
