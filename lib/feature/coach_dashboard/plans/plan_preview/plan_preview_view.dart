import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plan_preview/plan_preview_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PlanPreviewView extends StatelessWidget {
  const PlanPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
     final plan = context.watch<PlanPreviewController>().planData;
    return Scaffold(
      body: SafeArea(
        child: Padding(
           padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              SizedBox(height:ch(20) ,),
             Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AssetUtils.backArrow,
                    ),
                  ),
                 AppText(txt: "Anteprima Del Piano", fontSize: AppFontSize.f19,),
                  const SizedBox.shrink()
                ],
              ),
              SizedBox(height:ch(40) ,),
              Expanded(
                child: SingleChildScrollView(
                   physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Gradient Border Card
                        activityCard(
                          isGradient: true,
                          padding: EdgeInsets.all(cw(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: plan["title"],
                                fontSize: AppFontSize.f19,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(8)),
                              _infoRow("Tipologia:", plan["type"]),
                              _infoRow("Durata:", plan["duration"]),
                              _infoRow("Creato da:", plan["createdBy"]),
                            ],
                          ),
                        ),
                
                        SizedBox(height: ch(25)),
                        AppText(
                          txt: "Programma di formazione",
                        fontSize: AppFontSize.f14 + 8,
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: ch(15)),
                
                        // 🔹 Dynamic days list
                        ...List.generate(
                          plan["days"].length,
                          (index) {
                            final day = plan["days"][index];
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: ch(15)),
                              padding: EdgeInsets.all(cw(20)),
                              decoration: BoxDecoration(
                                color: AppColor.c1E1E1E,
                                borderRadius: BorderRadius.circular(cw(16)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    txt: day["title"],
                                    fontSize: AppFontSize.f18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.white,
                                  ),
                                  SizedBox(height: ch(10)),
                                  ...List.generate(
                                    day["exercises"].length,
                                    (i) => Padding(
                                      padding: EdgeInsets.only(bottom: ch(5)),
                                      child: AppText(
                                        txt: "• ${day["exercises"][i]}",
                                        color: AppColor.white.withOpacity(0.7),
                                        fontSize: AppFontSize.f15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                
                        SizedBox(height: ch(30)),
                
                        // 🔹 Bottom Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppButton(
                                text: "Usa questo piano",
                                buttonColor: AppColor.red,
                                textColor: AppColor.white,
                                fontWeight: FontWeight.w600,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: cw(12)),
                            Expanded(
                              child: AppButton(
                                text: "Modificare",
                                buttonColor: AppColor.transparent,
                                borderColor: AppColor.cC6C6C6,
                                isBorder: true,
                                textColor: AppColor.white,
                                fontWeight: FontWeight.w600,
                                onPressed: () {
                                   Navigator.pushNamed(context, RoutePaths.trainingPlanScreen);
                                },
                              ),
                            ),
                          ],
                        ),
                
                        SizedBox(height: ch(50)),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(4)),
      child: Row(
        children: [
          AppText(
            txt: label,
            color: AppColor.white.withOpacity(0.6),
            fontSize: AppFontSize.f15,
          ),
          SizedBox(width: cw(5)),
          AppText(
            txt: value,
            color: AppColor.white,
            fontSize: AppFontSize.f15,
          ),
        ],
      ),
    );
  }
}