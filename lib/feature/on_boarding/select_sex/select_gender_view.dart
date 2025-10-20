import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/select_sex/select_gender_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectGenderView extends StatelessWidget {
  const SelectGenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          onboaridngAppBar(
              context: context, activeSegments: 2, totalSegments: 5),
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
                    txt: "Dicci il tuo pronome.",
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
                        "Questo ci aiuta a personalizzare il tuo primo piano di\nallenamento e nutrizione.",
                    fontSize: AppFontSize.f18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.cFFFFFF.withOpacity(0.5),
                    height: 1.5,
                  ),
                  SizedBox(
                    height: ch(107),
                  ),
                  Consumer<SelectGenderController>(
                      builder: (context, model, child) {
                    return outlinedSelected(
                      "Maschio",
                      () {
                        model.isMale = true;
                        model.isFemale = false;
                      },
                      model.isMale == true
                          ? AppColor.red
                          : AppColor.transparent,
                      model.isMale == true ? 1.0 : 0.0,
                    );
                  }),
                  SizedBox(
                    height: ch(15),
                  ),
                  Consumer<SelectGenderController>(
                      builder: (context, model, child) {
                    return outlinedSelected(
                      "Femmina",
                      () {
                        model.isFemale = true;
                        model.isMale = false;
                      },
                      model.isFemale == true
                          ? AppColor.red
                          : AppColor.transparent,
                      model.isFemale == true ? 1.0 : 0.0,
                    );
                  }),
                  const Spacer(),
                  AppButton(
                      buttonColor: AppColor.white,
                      onPressed: () {
                        
                        Navigator.pushNamedAndRemoveUntil(context, RoutePaths.personHeight, (route) => false);
                      },
                      text: "Avanti",
                      fontSize: AppFontSize.f16,
                      textColor: AppColor.background,
                      fontWeight: FontWeight.w600),
                      SizedBox(height: ch(80),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget outlinedSelected(
    String txt, void Function() onTap, Color color, double width) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: ch(57),
      decoration: BoxDecoration(
          color: AppColor.c161616,
          borderRadius: BorderRadius.circular(cw(12)),
          border: Border.all(color: color, width: width)),
      child: AppText(
        txt: txt,
        color: AppColor.white,
        fontSize: AppFontSize.f15,
      ),
    ),
  );
}
