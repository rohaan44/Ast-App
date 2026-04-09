import 'package:ast_official/feature/tutor_dashboard/tutor_main_screen.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/sub_screens/tutor_submission_section_s2/tutor_submission_section_s2_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorSubmissionSectionS2View extends StatelessWidget {
  const TutorSubmissionSectionS2View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorSubmissionSectionS2Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ch(12)),
                  Row(
                    children: [
                      IconButton(
                        highlightColor: AppColor.transparent,
                        focusColor: AppColor.transparent,
                        splashColor: AppColor.transparent,
                        icon: SvgPicture.asset(AssetUtils.backArrow),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Center(
                          child: AppText(
                            txt: "Particolare dello studente",
                            fontSize: AppFontSize.f16 + 4,
                            isItalic: true,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: cw(40)),
                    ],
                  ),
                  SizedBox(
                    height: ch(24),
                  ),
                  GestureDetector(
                    onTap: () {
                      model.setUploadedFileName("file_example.pdf");
                    },
                    child: Container(
                      width: double.infinity,
                      height: ch(373),
                      padding: EdgeInsets.symmetric(
                          vertical: ch(40), horizontal: cw(16)),
                      decoration: BoxDecoration(
                        color: AppColor.c151515,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.c686868,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined,
                              color: AppColor.cFFFFFF, size: cw(20)),
                          SizedBox(height: ch(8)),
                          AppText(
                            txt: model.uploadedFileName ??
                                "Tap to Upload or Drag File Here",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                          SizedBox(height: ch(4)),
                          AppText(
                            txt: model.uploadedFileName ??
                                "Formato accettato MP4, PDF",
                            fontSize: 14,
                            color: AppColor.c7E7E7E,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ch(24),
                  ),
                  AppText(
                    txt: "Informazioni rapide sul file",
                    fontSize: AppFontSize.f16 + 4,
                    isItalic: true,
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: ch(10),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.c313131,
                      borderRadius: BorderRadius.circular(cw(20)),
                    ),
                    padding: EdgeInsets.all(cw(14)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppText(
                              txt: "Nome file: case_study_maria.pdf",
                              fontSize: AppFontSize.f16,
                              color: AppColor.cFFFFFF,
                            )
                          ],
                        ),
                        SizedBox(
                          height: ch(16),
                        ),
                        Row(
                          children: [
                            AppText(
                              txt: "Dimensioni: 2,4 MB",
                              fontSize: AppFontSize.f16,
                              color: AppColor.cFFFFFF,
                            )
                          ],
                        ),
                        SizedBox(
                          height: ch(16),
                        ),
                        Row(
                          children: [
                            AppText(
                              txt: "Caricato: 15 settembre 2025",
                              fontSize: AppFontSize.f16,
                              color: AppColor.cFFFFFF,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  AppButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorMainScreen()),
                        (route) => false,
                      );
                    },
                    text: "Scarica file",
                    // icon: SvgPicture.asset(AssetUtils.fireIcon),
                    color: AppColor.white,
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
