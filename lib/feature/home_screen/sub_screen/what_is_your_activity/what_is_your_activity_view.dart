import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/home_screen/sub_screen/what_is_your_activity/what_is_your_activity_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
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
      appBar: AppBar(
        surfaceTintColor: AppColor.c252525,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: AppColor.white,
          ),
        ),
        title: customSlider(5, 2, AppColor.white),
        actions: [
          SizedBox(
            width: cw(20),
          ),
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
          SizedBox(
            width: cw(20),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ch(20),
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
              height: ch(45),
            ),
            Consumer<WhatIsYourActivityController>(
              builder: (context, model, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.catType.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: cw(53),
                      crossAxisSpacing: cw(20),
                      mainAxisSpacing: cw(20)),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        model.setSelectIndex(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cw(16)),
                            border: Border.all(color: AppColor.c252525),
                            color: model.selectIndex == index
                                ? AppColor.primary
                                : AppColor.c252525.withOpacity(0.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                model.catType["iconImage"][index].toString()),
                            SizedBox(
                              width: cw(8),
                            ),
                            AppText(
                              txt: model.catType["type"][index].toString(),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cFFFFFF,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Spacer(),
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
