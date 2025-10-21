import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// Import the controller you just created
import 'select_objective_controller.dart';

class SelectObjectiveView extends StatelessWidget {
  const SelectObjectiveView({super.key});

  @override
  Widget build(BuildContext context) {
    // The Consumer widget listens for changes in your controller
    return Consumer<SelectObjectiveController>(
        builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(
          children: [
            // TOP GRADIENT APP BAR
            Container(
              padding: EdgeInsets.fromLTRB(cw(20), ch(40), cw(20), cw(20)),
              height: ch(150),
              decoration:
                  const BoxDecoration(gradient: AppGradients.redGradient),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetUtils.backArrow),
                  ),
                  SvgPicture.asset(
                    AssetUtils.logoIcon,
                    width: cw(60),
                    height: ch(25),
                  ),
                  const SizedBox.shrink()
                ],
              ),
            ),

            // MAIN CONTENT AREA
            Padding(
              padding: EdgeInsets.only(top: ch(114)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: cw(20)),
                      decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(cw(25)),
                          topRight: Radius.circular(cw(25)),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: ch(20)),
                            // --- HEADER TEXT ---
                            AppText(
                              txt:
                                  "Facci conoscere il tuo obiettivo e la\ntua esperienza",
                              fontSize: AppFontSize.f20,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cFFFFFF,
                              height: 1.3,
                            ),
                            SizedBox(height: ch(12)),
                            AppText(
                              txt:
                                  "Useremo la tua altezza per personalizzare i tuoi piani di fitness e nutrizione.",
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.5),
                              height: 1.5,
                            ),
                            SizedBox(height: ch(30)),

                            // --- FITNESS GOALS SECTION ---
                            AppText(
                              txt: "Obiettivo fitness",
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                            ),
                            SizedBox(height: ch(15)),
                            Wrap(
                              spacing: cw(10), // Horizontal space between chips
                              runSpacing: ch(10), // Vertical space between lines
                              children: controller.fitnessGoals.map((goal) {
                                final isSelected =
                                    controller.selectedGoals.contains(goal);
                                return _buildChip(
                                  label: goal,
                                  isSelected: isSelected,
                                  onTap: () => controller.toggleFitnessGoal(goal),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: ch(30)),

                            // --- EXPERIENCE LEVEL SECTION ---
                            AppText(
                              txt: "Livello di esperienza",
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                            ),
                            SizedBox(height: ch(15)),
                            Wrap(
                              spacing: cw(10),
                              runSpacing: ch(10),
                              children: controller.experienceLevels.map((level) {
                                final isSelected =
                                    controller.selectedExperience == level;
                                return _buildChip(
                                  label: level,
                                  isSelected: isSelected,
                                  onTap: () => controller.selectExperience(level),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: ch(100)), // Space for bottom button
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            // --- BOTTOM "AVANTI" BUTTON ---
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                child: Column(children: [
                   const Spacer(),
                     AppButton(
                                // isButtonEnable: isEnbleBtn,
                                borderRadius: cw(50),
                                onPressed: () {
                                 
                                   Navigator.pushNamedAndRemoveUntil(context, RoutePaths.welcomeView, (route) => false);
                                 
                                },
                                buttonColor: AppColor.cFFFFFF,
                                text: "Avanti",
                                fontWeight: FontWeight.w600,
                                textColor: AppColor.black,
                              ),
                              SizedBox(height: ch(40),)
                ],),
              ),
            )
            
          ],
        ),
      );
    });
  }

  /// A private helper widget to build the selectable chips, avoiding code repetition.
  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(12)),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.c252525 // Selected color
              : Colors.transparent, // Default color
          borderRadius: BorderRadius.circular(cw(30)),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : AppColor.c252525, // Border color
            width: 1,
          ),
        ),
        child: AppText(
          txt: label,
          color: AppColor.cFFFFFF, // Text color
          fontSize: 13.sp,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}