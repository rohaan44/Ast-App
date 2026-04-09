import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
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

import '../edit_ai_suggestion/edit_ai_suggestion_view.dart';

class SelectedCheckInView extends StatelessWidget {
  const SelectedCheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    final flowData = context.read<FlowDataProvider>().getFlowData(checkIn);
// final isRenew = flowData != null ? flowData["isRenew"] ?? false : false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              centerTextBackIconAppbar(
                  context: context, text: "Recensioni del check-in"),
              Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    activityCard(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: cw(50),
                              backgroundColor: AppColor.blue,
                              // backgroundImage: AssetImage(athlete["imagePath"]
                              // ),
                            ),
                            SizedBox(
                              width: cw(20),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  txt: flowData?["name"] ?? "N/A",
                                  fontSize: AppFontSize.f20,
                                ),
                                SizedBox(
                                  height: ch(8),
                                ),
                                AppText(
                                  txt: flowData?["date"] ?? "N/A",
                                  fontSize: AppFontSize.f15 - 2,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: ch(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Card 1: Weight Gain
                            activityCard(
                                width: cw(93),
                                height: ch(100),
                                isGradient: true,
                                child: activityInfoContent(
                                    topText: 'Peso',
                                    mainValue:
                                        "${flowData?["weight"]?.toString() ?? "N/A"} Kg",
                                    changeValue: '+0.2kg',
                                    isPositiveChange: true)),

                            // Card 2: Percentage Loss
                            activityCard(
                                width: cw(93),
                                height: ch(100),
                                isGradient: true,
                                child: activityInfoContent(
                                    topText: 'Vita',
                                    mainValue:
                                        '${flowData?["waist"]?.toString() ?? "N/A"} cm',
                                    changeValue: '-0.5 cm',
                                    isPositiveChange: false)),

                            // Card 3: Weight Gain
                            activityCard(
                                width: cw(93),
                                height: ch(100),
                                isGradient: true,
                                child: activityInfoContent(
                                    topText: 'Grasso',
                                    mainValue: '14.8%',
                                    changeValue: '+0.2kg',
                                    isPositiveChange: true)),
                          ],
                        ),
                        SizedBox(
                          height: ch(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            aiBodyWithLabel(),
                            AppButton(
                              buttonColor: AppColor.red,
                              borderRadius: cw(15),
                              textColor: AppColor.white,
                              width: cw(80),
                              fontSize: AppFontSize.f15 - 2,
                              onPressed: () {},
                              text: "Settimana \nprecedente",
                            )
                          ],
                        ),
                        SizedBox(
                          height: ch(20),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: cw(20), vertical: ch(20)),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(cw(12))),
                          height: ch(80),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    txt: "Nota dell'atleta",
                                    fontSize: AppFontSize.f18 + 2,
                                  ),
                                  SizedBox(
                                    height: ch(10),
                                  ),
                                  AppText(
                                    txt:
                                        "Più lento in palestra questa settimana",
                                    fontSize: AppFontSize.f18 - 2,
                                    color: AppColor.white.withOpacity(0.7),
                                  )
                                ],
                              ),
                              SvgPicture.asset(AssetUtils.colonIcon)
                            ],
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: ch(30)),
                    activityCard(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal:cw(15),vertical: ch(20)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(cw(12)),
                          border: Border.all(
                              color: AppColor.white.withOpacity(0.08)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔹 Title
                            AppText(
                              txt: "Allenamento lento",
                              fontSize: AppFontSize.f18 + 2,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white,
                            ),
                            SizedBox(height: ch(20)),

                            // 🔹 First gray box
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(10), vertical: ch(12)),
                              width: double.infinity,
                              height: ch(44),
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(0.07),
                                borderRadius: BorderRadius.circular(cw(12)),
                              ),
                              child: AppText(
                                txt:
                                    "Nutrizione: Aumentare i carboidrati del 5%",
                                color: AppColor.white.withOpacity(0.7),
                                fontSize: AppFontSize.f16-2,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: ch(15)),

                            // 🔹 Second gray box
                            Container(
                              alignment: Alignment.centerLeft,
                              height: ch(44),
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(16), vertical: ch(12)),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(0.07),
                                borderRadius: BorderRadius.circular(cw(12)),
                              ),
                              child: AppText(
                                txt:
                                    "Allenamento: aggiungi un giorno di riposo",
                                color: AppColor.white.withOpacity(0.7),
                                fontSize: AppFontSize.f16-2,
                              ),
                            ),
                            SizedBox(height: ch(20)),

                            // 🔹 Green bordered box
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(16), vertical: ch(12)),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(cw(8)),
                                border:
                                    Border.all(color: AppColor.c34C759, width: 1.2),
                                color: Colors.green.withOpacity(0.01),
                              ),
                              child: AppText(
                                txt:
                                    "Obiettivo in linea con i piani - Consigliati piccoli aggiustamenti",
                                color: AppColor.white.withOpacity(0.4),
                                fontSize: AppFontSize.f16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: ch(20)),

                            // 🔹 Buttons Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppButton(
                                    text: "Approvare",
                                    buttonColor: AppColor.c34C759,
                                    textColor: Colors.white,
                                    borderRadius: cw(12),
                                    fontSize: AppFontSize.f15,
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(width: cw(10)),
                                Expanded(
                                  child: AppButton(
                                    text: "Modificare",
                                    buttonColor: Colors.grey.shade800,
                                    textColor: Colors.white,
                                    borderRadius: cw(12),
                                    fontSize: AppFontSize.f15,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const EditAiSuggestionView()));
                                    },
                                  ),
                                ),
                                SizedBox(width: cw(10)),
                                Expanded(
                                  child: AppButton(
                                    text: "Respinto",
                                    buttonColor: Colors.red,
                                    textColor: Colors.white,
                                    borderRadius: cw(12),
                                    fontSize: AppFontSize.f15,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ch(40),)
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

Widget activityInfoContent({
  required String topText,
  required String mainValue,
  required String changeValue,
  required bool isPositiveChange,
}) {
  final Color changeColor =
      isPositiveChange ? const Color(0xff4CAF50) : const Color(0xffF44336);
  final IconData changeIcon =
      isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        txt: topText,
        color: Colors.white,
        fontSize: AppFontSize.f16,
      ),
      Center(
        child: AppText(
          txt: mainValue,
          color: Colors.white,
          fontSize: AppFontSize.f19,
          fontWeight: FontWeight.w500,
        ),
      ),
      Row(
        children: [
          Icon(
            changeIcon,
            color: changeColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          AppText(
            txt: changeValue,
            color: changeColor,
            fontSize: AppFontSize.f15,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ],
  );
}

Widget aiBodyWithLabel() {
  return Row(
    children: [
      Column(
        children: [
          Image.asset(
            AssetUtils.bodyFront,
            height: ch(80),
          ),
          SizedBox(
            height: ch(10),
          ),
          AppText(
            txt: "Fronte",
            color: AppColor.white.withOpacity(0.7),
            fontSize: AppFontSize.f15,
          )
        ],
      ),
      SizedBox(
        width: cw(5),
      ),
      Column(
        children: [
          Image.asset(
            AssetUtils.sideBody,
            height: ch(80),
          ),
          SizedBox(
            height: ch(10),
          ),
          AppText(
            txt: "Lato",
            color: AppColor.white.withOpacity(0.7),
            fontSize: AppFontSize.f15,
          )
        ],
      ),
      SizedBox(
        width: cw(5),
      ),
      Column(
        children: [
          Image.asset(
            AssetUtils.bodyBack,
            height: ch(80),
          ),
          SizedBox(
            height: ch(10),
          ),
          AppText(
            txt: "Indietro",
            color: AppColor.white.withOpacity(0.7),
            fontSize: AppFontSize.f15,
          )
        ],
      ),
    ],
  );
}
