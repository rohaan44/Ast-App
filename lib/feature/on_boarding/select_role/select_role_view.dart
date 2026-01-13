import 'dart:developer';

import 'package:ast_official/feature/on_boarding/select_role/select_role_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Import Provider

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    // We use ChangeNotifierProvider higher up in the widget tree (e.g., main.dart)
    // Here, we'll access it using a Consumer.
    return Scaffold(
      body: Consumer<SelectRoleController>(
        builder: (context, controller, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ch(45)),
                // --- Header ---
                Row(
                  children: [
                    SvgPicture.asset(AssetUtils.walkthroughIcon),
                    const Spacer(),
                    const Icon(
                      Icons.close,
                      color: AppColor.cFFFFFF,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(height: ch(30)),
                // --- Titles ---
                AppText(
                  txt: "Dicci chi sei per continuare.",
                  fontSize: AppFontSize.f22,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1.5,
                ),
                AppText(
                  txt:
                      "Seleziona l’opzione che ti descrive meglio. Questo\npersonalizzerà la tua esperienza.",
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.8),
                  height: 1.5,
                ),
                SizedBox(height: ch(42)),

                // --- Role Selection List ---
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final isSelected = controller.currentIndex == index;
                    final SelectType role = controller.selectTypeList[index];
                    return GestureDetector(
                      onTap: () => controller.selectRole(
                          index, role.english), // Call controller function
                      child: Container(
                        height: ch(100),
                        padding: EdgeInsets.symmetric(horizontal: cw(16)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  controller.selectTypeList[index].image),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(cw(12)),
                          border: Border.all(
                            color: isSelected
                                ? (index == 0
                                    ? AppColor.red
                                    : index == 1
                                        ? AppColor.cFFB236
                                        : index == 2
                                            ? AppColor.c336255
                                            : AppColor.transparent)
                                : AppColor.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  txt: controller.selectTypeList[index].title,
                                  fontSize: AppFontSize.f19,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.cFFFFFF,
                                  height: 1.5,
                                ),
                                SizedBox(
                                  width: cw(172),
                                  child: AppText(
                                    txt: controller
                                        .selectTypeList[index].subtitle,
                                    fontSize: AppFontSize.f15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.cFFFFFF.withOpacity(0.8),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: ch(20));
                  },
                  itemCount: controller.selectTypeList.length,
                ),

                const Spacer(),

                // --- Continue Button ---
                if (controller.currentIndex != null) ...[
                  AppButton(
                    buttonColor: AppColor.cFFFFFF,
                    onPressed: () {
                      final flowProvider = context.read<FlowDataProvider>();
                      final data = flowProvider.getFlowData(customerOnboarding);

                      log(data.toString());

                      controller.onContinuePressed(context);
                    },
                    child: AppText(
                      txt: "Continuare",
                      color: AppColor.black,
                      fontSize: AppFontSize.f16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: ch(40)),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
