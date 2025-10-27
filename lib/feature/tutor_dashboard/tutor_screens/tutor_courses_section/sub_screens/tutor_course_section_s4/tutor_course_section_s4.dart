import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_courses_section/sub_screens/tutor_course_section_s4/tutor_course_section_s4_controller.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';

class TutorCourseSectionS4View extends StatelessWidget {
  const TutorCourseSectionS4View({super.key});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCourseSectionS4Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(20)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          AssetUtils.backArrow,
                          height: ch(24),
                        ),
                      ),
                    ),
                    Center(
                      child: AppText(
                        txt: "Aggiungi modulo",
                        fontSize: AppFontSize.f16 + 4,
                        isItalic: true,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: cw(20), vertical: ch(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: const TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Inserisci nome corso",
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: ch(20)),
                            AppText(
                              txt: "Seleziona il tipo di modulo",
                              fontSize: 14,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: ch(12)),
                            Row(
                              children: [
                                Checkbox(
                                  shape: const CircleBorder(),
                                  value: model.selectedType == "pdf",
                                  onChanged: (val) {
                                    model.setSelectedType("pdf");
                                  },
                                  activeColor: AppColor.c34C759,
                                  checkColor: AppColor.black,
                                  side: const BorderSide(
                                      color: Colors.white54, width: 1.2),
                                ),
                                AppText(
                                  txt: "PDF",
                                  color: Colors.white,
                                  fontSize: AppFontSize.f16,
                                ),
                                Checkbox(
                                  shape: const CircleBorder(),
                                  value: model.selectedType == "video",
                                  onChanged: (val) {
                                    model.setSelectedType("video");
                                  },
                                  activeColor: AppColor.c34C759,
                                  checkColor: AppColor.black,
                                  side: const BorderSide(
                                      color: Colors.white54, width: 1.2),
                                ),
                                AppText(
                                  txt: "Video",
                                  color: Colors.white,
                                  fontSize: AppFontSize.f16,
                                ),
                              ],
                            ),
                            SizedBox(height: ch(20)),
                            GestureDetector(
                              onTap: () {
                                model.setUploadedFileName("file_example.pdf");
                              },
                              child: Container(
                                width: double.infinity,
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
                            const SizedBox(height: 20),
                            TextField(
                              controller: model.shortDescriptionController,
                              maxLines: 5,
                              style: const TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Note facoltative",
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ch(15),
                      ),
                      AppButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutePaths.tutorCourseSectionS5View);
                        },
                        text: "Aggiorna e salva",
                        fontSize: AppFontSize.f18,
                      )
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
}
