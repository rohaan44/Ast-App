import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plans_management/plans_management_controller.dart';
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

class PlansManagementView extends StatelessWidget {
  const PlansManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: "Plans",
                  fontSize: AppFontSize.f24,
                  isItalic: true,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    AssetUtils.profileIcon,
                    height: ch(40),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: "Libreria Dei Progetti",
                  fontSize: AppFontSize.f14 + 8,
                ),
                SizedBox(
                  height: ch(15),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<PlansManagementController>(
                          builder: (context, model, _) {
                        return AppButton(
                          isBorder: !model.isTab1,
                          borderWidth: 1.5,
                          borderColor: AppColor.c1E1E1E,
                          buttonColor: model.isTab1
                              ? AppColor.red
                              : AppColor.transparent,
                          text: "Modello personale",
                          textColor: AppColor.white,
                          onPressed: () {
                            model.isTab1 = true;
                            model.isTab2 = false;
                          },
                        );
                      }),
                    ),
                    SizedBox(width: cw(12)),
                    Expanded(
                      child: Consumer<PlansManagementController>(
                          builder: (context, model, _) {
                        return AppButton(
                          isBorder: !model.isTab2,
                          borderWidth: 1.5,
                          borderColor: AppColor.c1E1E1E,
                          textColor: AppColor.white,
                          buttonColor: model.isTab2
                              ? AppColor.red
                              : AppColor.transparent,
                          text: "Modello ufficiale AST",
                          onPressed: () {
                            model.isTab1 = false;
                            model.isTab2 = true;
                          },
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: ch(15),
                ),
                planView(),
                SizedBox(
                  height: ch(15),
                ),
                AppText(
                  txt: "Crea nuovo piano",
                  fontSize: AppFontSize.f14 + 8,
                ),
                SizedBox(
                  height: ch(15),
                ),
                planList(context),
              ],
            ),
          ))
        ],
      )),
    );
  }
}

Widget planView() {
  return Consumer<PlansManagementController>(
    builder: (context, controller, _) {
      final plans = controller.plans;

      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: cw(12),
          mainAxisSpacing: ch(12),
          childAspectRatio: 0.9,
          mainAxisExtent: ch(160),
        ),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return _planCard(
            title: plan["title"],
            createdDate: plan["createdDate"],
            duration: plan["duration"],
            onTap: () {
              if(index==0){
 Navigator.pushNamed(context, RoutePaths.planPreviewScreen);
           
              }else if(index==1){

 Navigator.pushNamed(context, RoutePaths.nutritionPlanScreen);
              }
              },
          );
        },
      );
    },
  );
}

Widget _planCard({
  required String title,
  required String createdDate,
  required String duration,
  required VoidCallback onTap,
}) {
  return Container(
    padding: EdgeInsets.all(cw(16)),
    height: 150,
    decoration: BoxDecoration(
      color: AppColor.c1E1E1E,
      borderRadius: BorderRadius.circular(cw(16)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ch(5),
        ),
        AppText(
          txt: title,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        SizedBox(height: ch(8)),
        AppText(
          txt: "Creato: $createdDate\nDurata: $duration",
          fontSize: AppFontSize.f14 + 4,
          color: AppColor.white.withOpacity(0.7),
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: ch(20),
        ),
        AppButton(
          width: cw(60),
          height: ch(28),
          borderRadius: cw(20),
          text: "Anteprima",
          buttonColor: AppColor.cEB5725,
          textColor: AppColor.white,
          fontSize: AppFontSize.f14 + 2,
          onPressed: onTap,
        ),
      ],
    ),
  );
}





Widget planList(BuildContext context) {
  final controller = context.watch<PlansManagementController>();

  return Column(
    children: controller.plansList.map((plan) {
      return Container(
        margin: EdgeInsets.only(bottom: ch(12)),
        padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(14)),
        decoration: BoxDecoration(
          gradient: AppGradients.redGradient, // 🔥 your app gradient
          borderRadius: BorderRadius.circular(cw(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(  
                  padding: EdgeInsets.all(cw(10)),
                  width: cw(42),
                  height: cw(42),
                  decoration: const BoxDecoration(
                    color: AppColor.c2A2A2A,
                    shape: BoxShape.circle,
                  ),
                  child:SvgPicture.asset(plan["icon"]!),
                ),
                SizedBox(width: cw(15)),
                // 🔹 Texts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      txt: plan["title"]!,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.f18,
                    ),
                    SizedBox(height: ch(8),),
                    AppText(
                      txt: plan["subtitle"]!,
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: AppFontSize.f15,
                    ),
                  ],
                ),
              ],
            ),
           SvgPicture.asset(AssetUtils.arrowForward)
          ],
        ),
      );
    }).toList(),
  );
}