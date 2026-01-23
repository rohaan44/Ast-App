import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/review_your_checkin/review_your_checkin_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ReviewYourCheckInView extends StatelessWidget {
  const ReviewYourCheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDismissKeyboard(
        child: Padding(
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
                      child: customSlider(4, 4, AppColor.cFFFFFF)),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: ch(40),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt: "Recensire il tuo check-in ",
                          fontSize: AppFontSize.f20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.cFFFFFF,
                          height: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt:
                              "Ecco un riepilogo dei tuoi progressi prima dell'invio.",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.cFFFFFF.withOpacity(0.5),
                          height: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(24),
                    ),
                    Consumer<ReviewYourCheckInController>(
                      builder: (context, model, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              txt: 'Peso',
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "La settimana scorsa",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.weightLastWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: ch(24),
                                    ),
                                    SvgPicture.asset(
                                      AssetUtils.arrowForward,
                                      height: ch(25),
                                      width: cw(25),
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "Questa settimana",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.weightThisWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            AppText(
                              txt: 'Vita',
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "La settimana scorsa",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.lifeLastWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: ch(24),
                                    ),
                                    SvgPicture.asset(
                                      AssetUtils.arrowForward,
                                      height: ch(25),
                                      width: cw(25),
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "Questa settimana",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.lifeThisWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            AppText(
                              txt: 'Braccia',
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "La settimana scorsa",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.armLastWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: ch(24),
                                    ),
                                    SvgPicture.asset(
                                      AssetUtils.arrowForward,
                                      height: ch(25),
                                      width: cw(25),
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: cw(16),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: "Questa settimana",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        height: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: ch(14),
                                      ),
                                      primaryTextField(
                                          controller: model.armThisWeek,
                                          keyboardType: TextInputType.number,
                                          border: InputBorder.none,
                                          hintText: "enter...")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: ch(60),
                    ),
                    Consumer<ReviewYourCheckInController>(
                      builder: (context, model, child) {
                        return AppButton(
                            isButtonEnable: model.isNext,
                            buttonColor: AppColor.cFFFFFF,
                            onPressed: () {
                            context
                                  .read<FlowDataProvider>()
                                  .addOrUpdateFlow(flowTag: checkInDiet, data: {
                                "progress": {
                                  "weight": {
                                    "lastWeek": model.weightLastWeek.text,
                                    "thisWeek": model.weightThisWeek.text
                                  },
                                  "waist": {
                                    "lastWeek": model.lifeLastWeek.text,
                                    "thisWeek": model.lifeThisWeek.text
                                  },
                                  "arm": {
                                    "lastWeek": model.armLastWeek.text,
                                    "thisWeek": model.armThisWeek.text
                                  }
                                },
                                "date":DateTime.now().toIso8601String()
                              });
                              
                              final flowData = context
                                  .read<FlowDataProvider>()
                                  .getFlowData(checkInDiet);
                              model.createCheckIn(requestBody: flowData??{}, context: context);
                            },
                            text: "Invia il check-in",
                            fontSize: AppFontSize.f18,
                            textColor: AppColor.c252525,
                            fontWeight: FontWeight.w600);
                      },
                    ),
                    SizedBox(
                      height: ch(40),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
