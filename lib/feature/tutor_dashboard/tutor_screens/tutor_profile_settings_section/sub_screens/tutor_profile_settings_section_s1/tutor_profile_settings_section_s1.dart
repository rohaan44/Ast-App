import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorProfileSettingsSectionS1View extends StatelessWidget {
  const TutorProfileSettingsSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TutorProfileSettingsSectionS1Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColor.black, // ✅ Set background (was missing)
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: ch(12)),

                /// HEADER
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
                          txt: "Profilo e impostazioni",
                          fontSize: AppFontSize.f20,
                          isItalic: true,
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: cw(40)),
                  ],
                ),

                SizedBox(height: ch(40)),

                /// PROFILE IMAGE PICKER
                GestureDetector(
                  onTap: () async {},
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: ch(120),
                        width: ch(120),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.redAccent, width: 3),
                          image: const DecorationImage(
                            image: AssetImage(AssetUtils.person),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipOval(
                          child: Container(
                            color: AppColor.black.withOpacity(0.1),
                            child: Center(
                              child: SvgPicture.asset(
                                AssetUtils.profileUpload,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          height: ch(28),
                          width: ch(28),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetUtils.cameraIcon,
                              height: ch(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ch(12)),
                AppText(
                  txt: "Tocca per cambiare foto",
                  color: AppColor.white,
                  fontSize: AppFontSize.f16,
                ),

                SizedBox(height: ch(44)),

                /// TEXTFIELDS
                primaryTextField(
                  hintText: "Nome e cognome",
                  border: InputBorder.none,
                ),
                SizedBox(height: ch(15)),
                primaryTextField(
                  hintText: "E-mail",
                  border: InputBorder.none,
                ),
                SizedBox(height: ch(15)),
                primaryTextField(
                  hintText: "Telefono (facoltativo)",
                  border: InputBorder.none,
                ),

                SizedBox(height: ch(15)),
                TextField(
                  maxLines: 5,
                  style: const TextStyle(color: AppColor.white),
                  decoration: InputDecoration(
                      hintText: "Bio",
                      hintStyle: TextStyle(
                        fontSize: AppFontSize.f15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.c8E8E8E,
                      ),
                      filled: true,
                      fillColor: AppColor.c151515,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: AppColor.c252525, width: cw(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: AppColor.c252525, width: cw(1)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: cw(16),
                        vertical: ch(16),
                      )),
                ),

                SizedBox(height: ch(20)),

                /// DETAILS CONTAINER
                Container(
                  padding: EdgeInsets.all(cw(16)),
                  decoration: BoxDecoration(
                      color: AppColor.c1E1E1E,
                      borderRadius: BorderRadius.circular(cw(12)),
                      border: Border.all(color: AppColor.c6C6C6C)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: "Dettagli professionali",
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.f16,
                        color: AppColor.cFFFFFF,
                      ),
                      SizedBox(height: ch(20)),

                      // ✅ Certifications Section
                      Container(
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                            color: AppColor.c1E1E1E,
                            borderRadius: BorderRadius.circular(
                              cw(14),
                            ),
                            border: Border.all(color: AppColor.c6C6C6C)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: "Certifications",
                              fontWeight: FontWeight.w500,
                              fontSize: AppFontSize.f14 + 2,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                            ),
                            SizedBox(height: ch(12)),
                            Row(
                              children: [
                                AppButton(
                                  height: ch(22),
                                  width: cw(101),
                                  onPressed: () {},
                                  buttonColor: AppColor.c34C759,
                                  text: "Coach nutrizionale",
                                  textColor: AppColor.cFFFFFF,
                                  fontSize: AppFontSize.f14 + 2,
                                ),
                                SizedBox(width: cw(12)),
                                AppButton(
                                  height: ch(22),
                                  width: cw(132),
                                  onPressed: () {},
                                  buttonColor: AppColor.c34C759,
                                  text: "Forza e condizionamento",
                                  textColor: AppColor.cFFFFFF,
                                  fontSize: AppFontSize.f14 + 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: ch(20)),

                      AppButton(
                        onPressed: () {},
                        buttonColor: AppColor.c1E1E1E,
                        isBorder: true,
                        borderColor: AppColor.c595959,
                        text: "+ Aggiungi certificazioni",
                        textColor: AppColor.cFFFFFF,
                        fontSize: AppFontSize.f14 + 2,
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
                        context, RoutePaths.tutorProfileSettingsSectionS2View);
                  },
                  text: "Salva modifiche",
                ),

                SizedBox(height: ch(40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
