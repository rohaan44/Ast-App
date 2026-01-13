import 'dart:io';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_edit_profile/coach_edit_profile_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachEditProfileView extends StatelessWidget {
  const CoachEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CoachEditProfileController>(context);
    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(
                  context: context, text: "Profilo e impostazioni"),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            padding: EdgeInsets.all(cw(5)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(cw(90)),
                                border: Border.all(color: AppColor.red)),
                            child: CircleAvatar(
                              radius: cw(55),
                              backgroundColor: AppColor.grey,
                              backgroundImage: model.profileImage != null
                                  ? FileImage(model.profileImage! as File)
                                  : const AssetImage(AssetUtils.scholarCap)
                                      as ImageProvider,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: PopupMenuButton<String>(
                              color: AppColor.grey,
                              onSelected: (value) {
                                if (value == 'upload') {
                                  // model.pickProfileImage();
                                } else if (value == 'delete') {
                                  model.deleteProfileImage();
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'upload',
                                  child: Row(
                                    children: [
                                      Icon(Icons.upload, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text("Carica foto",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                if (model.profileImage != null)
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete, color: AppColor.red),
                                        SizedBox(width: 8),
                                        Text("Elimina foto",
                                            style:
                                                TextStyle(color: AppColor.red)),
                                      ],
                                    ),
                                  ),
                              ],
                              child: Container(
                                padding: EdgeInsets.all(cw(8)),
                                decoration: const BoxDecoration(
                                  color: AppColor.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ch(15)),
                      AppText(
                        txt: "Tocca per cambiare foto",
                        fontSize: AppFontSize.f15,
                        color: AppColor.white.withOpacity(0.7),
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(height: ch(44)),
                      primaryTextField(
                          fillColor: AppColor.transparent,
                          border: InputBorder.none,
                          hintText: "Nome e cognome",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      primaryTextField(
                          fillColor: AppColor.transparent,
                          border: InputBorder.none,
                          hintText: "Indirizzo e-mail",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      primaryTextField(
                          fillColor: AppColor.transparent,
                          border: InputBorder.none,
                          hintText: "Numero di telefono",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      primaryTextField(
                          fillColor: AppColor.transparent,
                          border: InputBorder.none,
                          hintText: "biografia del profilo",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      primaryTextField(
                          border: InputBorder.none,
                          fillColor: AppColor.transparent,
                          hintText: "Specializzazione",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      primaryTextField(
                          border: InputBorder.none,
                          fillColor: AppColor.transparent,
                          hintText: "Identificativo della certificazione",
                          controller: TextEditingController()),
                      SizedBox(
                        height: ch(20),
                      ),
                      Container(
                        // width: cw(327),
                        
                        height: ch(52),
                        padding: EdgeInsets.symmetric(horizontal: ch(16),vertical: ch(16)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            cw(14),
                          ),
                          border: Border.all(color: AppColor.c252525),
                          color: AppColor.transparent,
                        ),
                        child: Row(children: [
                          AppText(txt: "Nessun documento caricato",fontSize: AppFontSize.f18, ),
                          const Spacer(),
                          AppText(txt:"+ Aggiungi file", color: AppColor.cFF8D28,fontSize: AppFontSize.f16-3,)
                        ],),
                      ),
                      SizedBox(
                        height: ch(30),
                      ),
                      AppButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutePaths.coachProfileSettingScreen, (route) => false);
                        },
                        text: "Salva modifiche",
                      ),
                      SizedBox(
                        height: ch(40),
                      )
                    ],
                  )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
