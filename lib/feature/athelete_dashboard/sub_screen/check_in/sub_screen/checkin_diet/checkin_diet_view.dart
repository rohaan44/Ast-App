import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/checkin_diet/checkin_diet_controller.dart';

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CheckInDietView extends StatelessWidget {
  const CheckInDietView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckInDietController>();
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
                const Spacer(),

                SizedBox(
                    width: cw(158),
                    child: customSlider(4, 1, AppColor.cFFFFFF)),
                const Spacer()
              ],
            ),
            SizedBox(
              height: ch(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: "Qual è il tuo peso attuale?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1,
                ),
              ],
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
                      Consumer<CheckInDietController>(
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
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: heightProvider.currentList.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      txt:
                                          "${heightProvider.currentList[index]}.0",
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
                      SizedBox(width: cw(8)),
                      Consumer<CheckInDietController>(
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
                buttonColor: AppColor.primary,
                onPressed: () {
                  final flowData = context
                      .read<FlowDataProvider>()
                      .addOrUpdateFlow(flowTag: checkInDiet, data: {
                    "weight": {
                      "value": model.getSelectedValue(),
                      "unit": model.getSelectedUnit()
                    }
                  });
                  Navigator.pushNamed(
                    context,
                    RoutePaths.bodyMeasurementView,
                  );
                },
                text: "Avanti",
                // fontSize: 16,
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
