import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';

class TutorCourseSectionS2View extends StatelessWidget {
  const TutorCourseSectionS2View({super.key});
  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TutorCourseSectionS2Controller>(context);

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
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                  physics: const BouncingScrollPhysics(),
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
                            // primaryTextField(
                            //     maxLength: 5,
                            //     keyboardType: TextInputType.number,
                            //     obscureText: true,
                            //     border: InputBorder.none,
                            //     hintText: "Nozioni di base sulla nutrizione",
                            //     controller: model.shortDescriptionController),
                            TextField(
                              style: TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Inserisci nome corso",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),
                            TextField(
                              maxLines: 5,
                              style: TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Scrivi una breve descrizione...",
                                hintStyle: TextStyle(color: Colors.grey),
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
                        height: ch(20),
                      ),
                      Container(
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: "Carica contenuto",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            TextField(
                              style: TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Es. 3 mesi",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            TextField(
                              style: TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Inserisci numero studenti",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RoutePaths.tutorCourseSectionS2View,
                                    (route) => false);
                              },
                              child: Container(
                                width: double.infinity,
                                height: ch(48),
                                padding: EdgeInsets.symmetric(vertical: ch(14)),
                                decoration: BoxDecoration(
                                  color: AppColor.c1E1E1E,
                                  borderRadius: BorderRadius.circular(cw(50)),
                                  border:
                                      Border.all(color: Colors.grey.shade800),
                                ),
                                child: Center(
                                  child: AppText(
                                    txt: "+ Carica nuovo file",
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ch(20),
                      ),
                      Container(
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: "Quiz sui collegamenti",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            TextField(
                              style: TextStyle(color: AppColor.white),
                              decoration: InputDecoration(
                                hintText: "Scrivi una nota finale...",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: AppColor.c151515,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RoutePaths.tutorCourseSectionS3View,
                                    (route) => false);
                              },
                              child: Container(
                                width: double.infinity,
                                height: ch(48),
                                padding: EdgeInsets.symmetric(vertical: ch(14)),
                                decoration: BoxDecoration(
                                  color: AppColor.c1E1E1E,
                                  borderRadius: BorderRadius.circular(cw(50)),
                                  border:
                                      Border.all(color: Colors.grey.shade800),
                                ),
                                child: Center(
                                  child: AppText(
                                    txt: "+ Aggiungi nuovo collegamento",
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ch(20),),
                      AppButton(
                        onPressed: () {},
                        text: "Salva modifiche",
                      ),
                      
                      SizedBox(height: ch(30),),
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
