import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WhatIsYourActivity extends StatefulWidget {
  const WhatIsYourActivity({super.key});

  @override
  State<WhatIsYourActivity> createState() => _WhatIsYourActivityState();
}

class _WhatIsYourActivityState extends State<WhatIsYourActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  SizedBox(
              height: ch(50),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left logo
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AssetUtils.backArrow,
                  ),
                ),
                SizedBox(
                    width: cw(158), child: customSlider(5, 2, AppColor.white)),
                Container(
                  width: cw(57),
                  height: ch(26),
                  decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(cw(20))),
                  child: Center(
                    child: AppText(
                      txt: "2 of 5",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.cFFFFFF,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: ch(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: "Qual è il tuo livello di attività?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1,
                ),
              ],
            ),
            SizedBox(
              height: ch(50),
            ),
        Consumer<WhatIsYourActivityController>(
  builder: (context, model, child) {
    final types = model.catType["type"]!;
    final icons = model.catType["iconImage"]!;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: cw(12), // space between horizontal cards
      runSpacing: 16, // space between rows
      children: List.generate(types.length, (index) {
        final isSelected = model.selectedIndex == index;

        return GestureDetector(
          onTap: () => model.setSelectIndex(index),
          child: Container(
            width:cw(160), // 2 per row
            height: ch(53),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.primary
                  : AppColor.c252525.withOpacity(0.3),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected ? AppColor.primary : AppColor.c252525,
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icons[index],
                  width: 20,
                ),
                const SizedBox(width: 8),
                AppText(
                  txt: types[index],
                  fontSize:AppFontSize.f19,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                ),
              ],
            ),
          ),
        );
      }),
    );
  },
)
,const Spacer(),
            AppButton(
                buttonColor: AppColor.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      RoutePaths.whatIsYourDietTypeView, (route) => false);
                },
                text: "Avanti",
                fontSize: 16,
                textColor: AppColor.cFFFFFF,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: ch(32),
            )
          ],
        ),
      ),
    );
  }
}
