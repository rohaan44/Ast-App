import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/person_height/person_height_controller.dart';
import 'package:ast_official/feature/on_boarding/select_weight/select_weight_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectWeightView extends StatelessWidget {
  const SelectWeightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          onboaridngAppBar(
              context: context, activeSegments: 5, totalSegments: 6),
          SizedBox(
            height: ch(114),
          ),
          Padding(
            padding: EdgeInsets.only(top: ch(114)),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: cw(20)),
              decoration: BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cw(25)),
                      topRight: Radius.circular(cw(25)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ch(20),
                  ),
                  AppText(
                    txt: "Conosciamo il tuo peso.",
                    fontSize: AppFontSize.f20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.cFFFFFF,
                    height: 1,
                  ),
                  SizedBox(
                    height: ch(12),
                  ),
                  AppText(
                    txt:
                        "Useremo la tua altezza per personalizzare i tuoi piani\ndi fitness e nutrizione.",
                    fontSize: AppFontSize.f18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.cFFFFFF.withOpacity(0.5),
                    height: 1.5,
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
                            Consumer<SelectWeightController>(
                              builder: (context, heightProvider, _) {
                                return ClipRect(
                                  child: SizedBox(
                                    width: cw(50),
                                    child: ListWheelScrollView.useDelegate(
                                      physics: const FixedExtentScrollPhysics(),
                                      itemExtent: ch(40),
                                      perspective: 0.008,
                                      diameterRatio: 2.5,
                                      onSelectedItemChanged: (index) {
                                        heightProvider.setSelectedIndex(index);
                                      },
                                      childDelegate:
                                          ListWheelChildBuilderDelegate(
                                        childCount:
                                            heightProvider.currentList.length,
                                        builder: (context, index) => Center(
                                          child: AppText(
                                            txt: heightProvider
                                                .currentList[index],
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
                            Consumer<SelectWeightController>(
                              builder: (context, heightProvider, _) {
                                return ClipRect(
                                  child: SizedBox(
                                    width: cw(70),
                                    child: ListWheelScrollView(
                                      perspective: 0.008,
                                      diameterRatio: 2.5,
                                      itemExtent: ch(40),
                                      physics: const FixedExtentScrollPhysics(),
                                      onSelectedItemChanged: (index) {
                                        heightProvider.toggleUnit();
                                      },
                                      children: [
                                        Center(
                                          child: AppText(
                                            txt: "kg",
                                            fontSize: AppFontSize.f16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Center(
                                          child: AppText(
                                            txt: "libbre",
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
                      buttonColor: AppColor.white,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, RoutePaths.selectObjective, (route) => false);
                      },
                      text: "Avanti",
                      fontSize: AppFontSize.f16,
                      textColor: AppColor.background,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: ch(40),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
