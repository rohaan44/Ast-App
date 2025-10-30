import 'dart:math';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/plans/trainning_plan/training_plan_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TrainingPlanView extends StatelessWidget {
  const TrainingPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: Column(
              children: [
                SizedBox(
                  height: ch(20),
                ),
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
                    AppText(
                      txt: "Piano Di Allenamento",
                      fontSize: AppFontSize.f19,
                    ),
                    const SizedBox.shrink()
                  ],
                ),
                SizedBox(
                  height: ch(40),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      activityCard(
                          isGradient: true, child: trainingPlanTabs(context)),
      
                      SizedBox(
                        height: ch(20),
                      ),
                      AppText(
                        txt: "Redattore manuale",
                        fontSize: AppFontSize.f14 + 8,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: ch(15)),
                     
      Consumer<TrainingPlanController>(
        builder: (context, controller, _) {
      return Column(
        children: List.generate(
          controller.weekPlans.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: ch(20)),
            child: weekPlanCard(controller.weekPlans[index], index, context),
          ),
        ),
      );
        },
      ),
                      // 🔹 Bottom Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppButton(
                              text: "Salva piano",
                              buttonColor: AppColor.red,
                              textColor: AppColor.white,
                              fontWeight: FontWeight.w600,
                              onPressed: () {
                                 Navigator.pushNamed(context, RoutePaths.plansManagementScreen);
                              },
                            ),
                          ),
                          SizedBox(width: cw(12)),
                          Expanded(
                            child: AppButton(
                              text: "Piano di anteprima",
                              buttonColor: AppColor.transparent,
                              borderColor: AppColor.cC6C6C6,
                              isBorder: true,
                              textColor: AppColor.white,
                              fontWeight: FontWeight.w600,
                              onPressed: () {
                                 Navigator.pushNamed(context, RoutePaths.planPreviewScreen);
                              },
                            ),
                          ),
                        ],
                      ),
      
                      SizedBox(height: ch(50)),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget weekPlanCard(Map<String, dynamic> weekData, int weekIndex, BuildContext context) {
  final controller = context.read<TrainingPlanController>();

  return Container(
    padding: EdgeInsets.all(cw(16)),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.cC6C6C6.withOpacity(0.7),width: 1.5),
      borderRadius: BorderRadius.circular(cw(12)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Week Title
        AppText(
          txt: "Settimana ${weekIndex + 1}",
          fontSize: AppFontSize.f18,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        SizedBox(height: ch(10)),

        // 🔹 Days Loop
        ...List.generate(weekData["days"].length, (dayIndex) {
          final day = weekData["days"][dayIndex];

          return Container(
            
    padding: EdgeInsets.symmetric(vertical: ch(15)),
            margin: EdgeInsets.only(bottom: ch(20)),
            decoration: BoxDecoration(
              border: Border.all(color:AppColor.white.withOpacity(0.5),),
              borderRadius: BorderRadius.circular(cw(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day Title Editable
               _editableRow(
  label: day["title"],
  uniqueKey: "week${weekIndex}_day${dayIndex}_title",
  context: context,
  onChanged: (val) => controller.updateDayTitle(weekIndex, dayIndex, val),
),

...List.generate(day["exercises"].length, (i) {
  final ex = day["exercises"][i];
  return _editableRow(
    label: ex,
    uniqueKey: "week${weekIndex}_day${dayIndex}_ex$i",
    context: context,
    onChanged: (val) => controller.updateExercise(weekIndex, dayIndex, i, val),
  );
}),
              ],
            ),
          );
        }),

        // 🔹 Add New Exercise Button

        AppButton(
          textColor: AppColor.white,
          text: "+ Aggiungi esercizio",
          isBorder: true,
          buttonColor: AppColor.transparent,
          borderColor: AppColor.white.withOpacity(0.7),
          borderWidth: 1.5,
          onPressed: (){
          controller.addExercise(weekIndex);
        }),
      ],
    ),
  );
}


Widget _editableRow({
  required String label,
  required String uniqueKey,
  required Function(String) onChanged,
  required BuildContext context,
}) {
  final controller = context.read<TrainingPlanController>();
  final textController = controller.getController(uniqueKey, label);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(8), vertical: ch(5)),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            style: TextStyle(
              color: AppColor.white,
              fontSize: AppFontSize.f15,
            ),
            decoration:  InputDecoration(
    //            border: UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.grey),
    // ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColor.white.withOpacity(0.5),width: 0.5), // color when not focused
    ),
    focusedBorder:const  UnderlineInputBorder(
      borderSide: BorderSide(color: AppColor.white, width: 1.0), // color when focused
    ),
          
            ),
            
            onChanged: (val) {
              controller.updateText(uniqueKey, val);
              onChanged(val);
            },
          ),
        ),
        Icon(Icons.edit, color: AppColor.white.withOpacity(0.7), size: 18),
      ],
    ),
  );
}

Widget activityCard({
  required Widget child,
  bool isGradient = true,
  double borderRadius = 16,
  double borderWidth = 2,
  EdgeInsets? padding,
  double? width,
  ImageProvider? image,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: image != null
          ? DecorationImage(
              image: image,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColor.background.withOpacity(0.8), BlendMode.darken))
          : null,
      border: Border.all(
          width: isGradient == false ? 3 : 0,
          color: isGradient == false ? AppColor.c2C2C32 : AppColor.transparent),
      gradient: isGradient ? AppGradients.redGradient : null,
      color: isGradient ? null : AppColor.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: isGradient
        ? Padding(
            padding: EdgeInsets.all(borderWidth),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(borderRadius - 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: child,
            ),
          )
        : Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
  );
}

Widget trainingPlanTabs(BuildContext context) {
  final tabProvider = Provider.of<TrainingPlanController>(context);
  final List<String> tabs = ["Panoramica", "Settimana", "Giorno"];

  return Container(
    height: cw(300),
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(cw(16)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: cw(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: ch(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // border: Border.all(color: AppColor.red, width: 1.5),
              color: const Color(0xFF1A1A1A),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                final isSelected = tabProvider.selectedIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => tabProvider.selectTab(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? AppColor.red
                                : AppColor.white.withOpacity(0.08),
                            width: 1.5,
                          ),
                        ),
                        color: isSelected ? null : Colors.transparent,
                      ),
                      child: Center(
                        child: AppText(
                          txt: tabs[index],
                          color: isSelected
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.7),
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
          SizedBox(
            height: ch(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    txt: tabProvider.planData["title"],
                    fontSize: AppFontSize.f20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  SizedBox(height: ch(8)),
                  _infoRow("Tipologia:", tabProvider.planData["type"]),
                  _infoRow("Durata:", tabProvider.planData["duration"]),
                  _infoRow("Focus:", tabProvider.planData["focus"]),
                ],
              ),
              progressRing(
                percent: 65,
                size: 60,
                progressColor: AppColor.red,
                backgroundColor: AppColor.background,
              ),
            ],
          ),
          const Spacer(),
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
          SizedBox(
            height: ch(15),
          ),
        ],
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
          color: AppColor.white.withOpacity(0.7),
          fontWeight: FontWeight.w500,
          fontSize: AppFontSize.f16,
        ),
      ),
    ),
  );
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

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Base ring
    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final sweepAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
