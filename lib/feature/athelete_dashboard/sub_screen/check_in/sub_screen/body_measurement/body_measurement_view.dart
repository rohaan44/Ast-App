import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/body_measurement/body_measurement_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BodyMeasurementView extends StatelessWidget {
  const BodyMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: ch(50),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left logo
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AssetUtils.backArrow,
                    ),
                  ),
                  const Spacer(),

                  SizedBox(
                      width: cw(158),
                      child: customSlider(4, 2, AppColor.cFFFFFF)),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: ch(40),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt: "Qual è la tua misurazione corporea?",
                          fontSize: AppFontSize.f20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.cFFFFFF,
                          height: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(48),
                    ),
                    Consumer<BodyMeasurementController>(
                      builder: (context, model, child) {
                        // bool isNext = model.email.text.isNotEmpty &&
                        //     model
                        //         .waistCircumferenceController.text.isNotEmpty &&
                        //     model.armController.text.isNotEmpty &&
                        //     model.flanksController.text.isNotEmpty &&
                        //     model.thighsController.text.isNotEmpty;
                        return Column(
                          children: [
                            primaryTextField(
                                textFieldHeight: ch(49),
                                controller: model.email,
                                border: InputBorder.none,
                                hintText: "Torace"),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                                textFieldHeight: ch(49),
                                controller: model.waistCircumferenceController,
                                border: InputBorder.none,
                                hintText: "Circonferenza vita"),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                                textFieldHeight: ch(49),
                                controller: model.flanksController,
                                border: InputBorder.none,
                                hintText: "Fianchi"),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                                textFieldHeight: ch(49),
                                controller: model.armController,
                                border: InputBorder.none,
                                hintText: "Braccia"),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                                textFieldHeight: ch(49),
                                controller: model.thighsController,
                                border: InputBorder.none,
                                hintText: "Cosce"),
                            SizedBox(
                              height: ch(16),
                            ),
                          ],
                        );
                      },
                    ),
                    // ListView.separated(
                    //     shrinkWrap: true,
                    //     primary: false,
                    //     itemBuilder: (context, index) {
                    //       return primaryTextField(
                    //           textFieldHeight: ch(49),
                    //           border: InputBorder.none,
                    //           hintText: index == 0
                    //               ? "Torace"
                    //               : index == 1
                    //                   ? "Circonferenza vita"
                    //                   : index == 2
                    //                       ? "Fianchi"
                    //                       : index == 3
                    //                           ? "Braccia"
                    //                           : "Cosce");
                    //     },
                    //     separatorBuilder: (context, index) {
                    //       return SizedBox(
                    //         height: ch(16),
                    //       );
                    //     },
                    //     itemCount: 5),

                    SizedBox(
                      height: ch(16),
                    ),
                    AppText(
                      txt: "Foto Check-in",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.2,
                    ),
                    SizedBox(
                      height: ch(10),
                    ),
                    AppText(
                      txt: "Richiesta: Carica 3 foto (fronte, lato, retro).",
                      height: 1.2,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: ch(12),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: ch(16), horizontal: cw(17)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cw(14)),
                          border: Border.all(
                              color: AppColor.c454545, width: cw(0.5))),
                      child: Consumer<BodyMeasurementController>(
                        builder: (context, model, _) {
                          return Column(
                            children: [
                              uploadPicture(
                                title: "Carica la tua foto frontale",
                                onTap: () {
                                  model.pickImage();
                                },
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: ch(16), horizontal: cw(17)),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(cw(14)),
                                          border: Border.all(
                                              color: AppColor.c454545,
                                              width: cw(0.5))),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: ch(50),
                                            width: cw(50),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        cw(15)),
                                                color: AppColor.cFFFFFF
                                                    .withOpacity(0.05)),
                                            child: Center(
                                              child: AppText(
                                                txt: "Foto",
                                                height: 1.2,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: AppColor.c454545,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: cw(10),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  txt: "AST-2025-00923",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  height: 1.2,
                                                ),
                                                AppText(
                                                  txt: model
                                                      .selectedImages[index]
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  height: 1.2,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: AppColor.cFFFFFF
                                                      .withOpacity(0.7),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              model.removeImage(index);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: ch(12),
                                    );
                                  },
                                  itemCount: model.selectedImages.length),
                              SizedBox(
                                height: ch(75),
                              ),
                              AppButton(
                                  isButtonEnable: model.isNextEnabled,
                                  buttonColor: AppColor.primary,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutePaths.statusFeedbackView,
                                    );
                                  },
                                  text: "Avanti",
                                  fontSize: 16,
                                  textColor: AppColor.cFFFFFF,
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                height: ch(40),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ))
            ])));
  }
}

Widget uploadPicture({required String title, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: ch(16), horizontal: cw(17)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cw(14)),
          border: Border.all(color: AppColor.c454545, width: cw(0.5))),
      child: Column(
        children: [
          Container(
            height: ch(50),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cw(14)),
                color: AppColor.cFFFFFF.withOpacity(0.02)),
            child: Center(
              child: AppText(
                txt: "+",
                height: 1.2,
                fontWeight: FontWeight.w500,
                fontSize: AppFontSize.f24,
                color: AppColor.c454545,
              ),
            ),
          ),
          SizedBox(
            height: ch(15),
          ),
          AppText(
            color: AppColor.cFFFFFF.withOpacity(0.7),
            txt: title,
            fontWeight: FontWeight.w400,
            fontSize: AppFontSize.f18,
            height: 1.2,
          ),
        ],
      ),
    ),
  );
}
