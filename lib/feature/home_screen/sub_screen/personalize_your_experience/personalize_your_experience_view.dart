import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalizYourExperience extends StatefulWidget {
  const PersonalizYourExperience({super.key});

  @override
  State<PersonalizYourExperience> createState() =>
      _PersonalizYourExperienceState();
}

class _PersonalizYourExperienceState extends State<PersonalizYourExperience> {
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
        title: customSlider(5, 1, AppColor.white),
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
                txt: "1 of 5",
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
                  txt: "Qual è il tuo peso ideale?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1,
                ),
              ],
            ),
            SizedBox(
              height: ch(12),
            ),
            SizedBox(
              height: ch(107),
            ),
            SizedBox(
              height: ch(240),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<PersonHeightController>(
                        builder: (context, heightProvider, _) {
                          return ClipRect(
                            child: SizedBox(
                              width: cw(50),
                              child: ListWheelScrollView.useDelegate(
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: ch(40),
                                perspective: 0.001,
                                diameterRatio: 1.5,
                                onSelectedItemChanged: (index) {
                                  heightProvider.setSelectedIndex(index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: heightProvider.currentList.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      txt: heightProvider.currentList[index],
                                      fontSize: AppFontSize.f16,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Consumer<PersonHeightController>(
                        builder: (context, heightProvider, _) {
                          return ClipRect(
                            child: SizedBox(
                              width: cw(70),
                              child: ListWheelScrollView(
                                itemExtent: ch(40),
                                physics: const FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  heightProvider.toggleUnit();
                                },
                                children: [
                                  Center(
                                    child: AppText(
                                      txt: "Kg",
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Center(
                                    child: AppText(
                                      txt: "cm",
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: ch(45), // highlight the selected item area
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
                buttonColor: AppColor.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      RoutePaths.whatIsYourActivityView, (route) => false);
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
