import 'dart:math';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/nutrition_plan/food_substitution/food_substitution_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/nutrition_plan/shooping_list/shopping_list_view.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'nutrition_plan_controller.dart';

class NutritionPlanView extends StatelessWidget {
  const NutritionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NutritionPlanController>();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(20)),

              // 🔙 Back + Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetUtils.backArrow),
                  ),
                  AppText(
                    txt: "Piano Nutrizionale",
                    fontSize: AppFontSize.f19 + 2,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  const SizedBox(width: 24), // balance
                ],
              ),

              SizedBox(height: ch(25)),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      activityCard(
                          padding: const EdgeInsets.all(0),
                          isGradient: true,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: ch(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(cw(12)),
                              color: const Color(0xFF1A1A1A),
                            ),
                            child: Column(
                              children: [
                                //tabs
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: ch(10)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    // border: Border.all(color: AppColor.red, width: 1.5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                        controller.tabs.length, (index) {
                                      final isSelected =
                                          controller.selectedTab == index;

                                      return Expanded(
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.selectTab(index),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            padding: EdgeInsets.symmetric(
                                                vertical: ch(15)),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: isSelected
                                                      ? AppColor.red
                                                      : AppColor.white
                                                          .withOpacity(0.08),
                                                  width: 1.5,
                                                ),
                                              ),
                                              color: isSelected
                                                  ? null
                                                  : Colors.transparent,
                                            ),
                                            child: Center(
                                              child: AppText(
                                                txt: controller.tabs[index],
                                                color: isSelected
                                                    ? AppColor.white
                                                    : AppColor.white
                                                        .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                                fontSize: AppFontSize.f16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),

                                if (controller.selectedTab == 0)...[
  Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: cw(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: ch(10),),
                                            AppText(
                                              txt:
                                                  "Piano Alimentare Di Taglio\nGenerato AI",
                                              fontSize: AppFontSize.f20,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.white,
                                            ),
                                            SizedBox(height: ch(6)),
                                            AppText(
                                              txt: controller.plan["macros"],
                                              fontSize: AppFontSize.f15,
                                              height: 1.5,
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                          ],
                                        ),
                                      ),
                                      progressRing(
                                        percent: controller.plan["progress"],
                                        size: 60,
                                        progressColor: AppColor.red,
                                        backgroundColor: AppColor.c252525,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: ch(20),
                                ),
                                ...controller.plan["meals"].map<Widget>((meal) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: ch(15),
                                    ),
                                    child: mealCard(meal),
                                  );
                                }).toList(),

                                SizedBox(
                                  height: ch(20),
                                ),

                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: cw(20)),
                                  child: Column(
                                    children: [
                                      AppButton(
                                        onPressed: () {},
                                        text: "Applica il piano",
                                      ),
                                  
                                       SizedBox(
                                    height: ch(10),
                                  ),
                                  AppButton(
                                    onPressed: () {},
                                    text: "Rigenerarsi con IA",
                                    isBorder: true,
                                    borderWidth: 1.5,
                                    borderColor: AppColor.c333333,
                                    buttonColor: AppColor.transparent,
                                    textColor: AppColor.white,
                                  ),
                                    ],
                                  ),
                                ),

                                ]
  // AiMealPlanView(data: controller.plan)
else if (controller.selectedTab == 1)
  FoodSubstitutionView(mealData: controller.foodSubstitution)
 else
   const ShoppingListView()

                              
                               
                              
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),

              // 🔹 Tab Bar
              // Container(
              //   height: ch(45),
              //   decoration: BoxDecoration(
              //     gradient: AppGradients.redGradient,
              //     borderRadius: BorderRadius.circular(cw(16)),
              //   ),
              //   padding: EdgeInsets.all(cw(2)),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF121212),
              //       borderRadius: BorderRadius.circular(cw(14)),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: List.generate(controller.tabs.length, (index) {
              //         final isSelected = controller.selectedTab == index;
              //         return Expanded(
              //           child: GestureDetector(
              //             onTap: () => controller.selectTab(index),
              //             child: AnimatedContainer(
              //               duration: const Duration(milliseconds: 200),
              //               decoration: BoxDecoration(
              //                 border: Border(
              //                   bottom: BorderSide(
              //                     color: isSelected
              //                         ? AppColor.red
              //                         : Colors.transparent,
              //                     width: 1.5,
              //                   ),
              //                 ),
              //               ),
              //               child: Center(
              //                 child: AppText(
              //                   txt: controller.tabs[index],
              //                   fontSize: AppFontSize.f15,
              //                   color: isSelected
              //                       ? AppColor.white
              //                       : AppColor.white.withOpacity(0.5),
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       }),
              //     ),
              //   ),
              // ),


            ],
          ),
        ),
      ),
    );
  }

  Widget mealCard(Map<String, dynamic> meal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ch(10)),
      child: Container(
        padding: EdgeInsets.all(cw(16)),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(cw(12)),
          color: AppColor.c1E1E1E,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              txt: meal["title"],
              fontSize: AppFontSize.f18,
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: ch(10)),
            ...meal["items"].map<Widget>((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: ch(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(cw(8)),
                          decoration: BoxDecoration(
                            color: AppColor.c252525,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SvgPicture.asset(
                            item["icon"],
                            height: ch(18),
                          ),
                        ),
                        SizedBox(width: cw(10)),
                        AppText(
                          txt: item["name"],
                          height: 1.5,
                          fontSize: AppFontSize.f15,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          txt: item["secondary1"],
                          fontSize: AppFontSize.f14 + 2,
                          color: AppColor.white.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: ch(6),
                        ),
                        AppText(
                          txt: item["secondary2"],
                          fontSize: AppFontSize.f14 + 2,
                          color: AppColor.white.withOpacity(0.7),
                        ),
                      ],
                    ),
                    SvgPicture.asset(AssetUtils.arrowForward)
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget progressRing({
    required double percent,
    double size = 54,
    double strokeWidth = 6,
    Color backgroundColor = AppColor.c252525,
    Color progressColor = AppColor.red,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ProgressPainter(
          percent: percent,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
        ),
        child: Center(
          child: AppText(
            txt: '${percent.toInt()}%',
            color: AppColor.white.withOpacity(0.8),
            fontSize: AppFontSize.f15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double percent;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _ProgressPainter({
    required this.percent,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * (percent / 100),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
