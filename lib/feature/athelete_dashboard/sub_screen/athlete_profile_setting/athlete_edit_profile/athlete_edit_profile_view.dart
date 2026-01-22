import 'dart:developer';

import 'dart:io';
import 'dart:ui';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_edit_profile/athlete_edit_profile_controller.dart';
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

class AthleteEditProfileView extends StatelessWidget {
  const AthleteEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AthleteEditProfileController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!model.isProfileFetched && !model.isLoading) {
        model.getProfileData(context);
        log("""""message""" "${model.profileData}");
      }
    });
    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, RoutePaths.athleteProfileSetting),
                  context: context,
                  text: "Profilo e impostazioni"),
              Consumer<AthleteEditProfileController>(
                  builder: (context, model, child) {
                return Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(cw(5)),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(cw(90)),
                                      border: Border.all(color: AppColor.red)),
                                  child: CircleAvatar(
                                    radius: cw(55),
                                    backgroundColor: AppColor.grey,
                                    backgroundImage: model.profileImage != null
                                        ? FileImage(model.profileImage! as File)
                                        : const AssetImage(
                                                AssetUtils.scholarCap)
                                            as ImageProvider,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: PopupMenuButton<String>(
                                    color: AppColor.c121212,
                                    onSelected: (value) {
                                      if (value == 'upload') {
                                        model.pickProfileImage(context);
                                      } else if (value == 'delete') {
                                        model.deleteProfileImage();
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 'upload',
                                        child: Row(
                                          children: [
                                            Icon(Icons.upload,
                                                color: Colors.white),
                                            SizedBox(width: 8),
                                            Text("Carica foto",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      if (model.profileImage != null)
                                        const PopupMenuItem(
                                          value: 'delete',
                                          child: Row(
                                            children: [
                                              Icon(Icons.delete,
                                                  color: AppColor.red),
                                              SizedBox(width: 8),
                                              Text("Elimina foto",
                                                  style: TextStyle(
                                                      color: AppColor.red)),
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
                              controller: model.nameController,
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            primaryTextField(
                                fillColor: AppColor.transparent,
                                border: InputBorder.none,
                                hintText: "Indirizzo e-mail",
                                controller: model.emailController),
                            SizedBox(
                              height: ch(20),
                            ),
                            primaryTextField(
                                fillColor: AppColor.transparent,
                                border: InputBorder.none,
                                hintText: "Numero di telefono",
                                controller: model.phoneController),
                            SizedBox(
                              height: ch(20),
                            ),
                            primaryTextField(
                                fillColor: AppColor.transparent,
                                border: InputBorder.none,
                                hintText: "biografia del profilo",
                                controller: model.bioController),
                            SizedBox(
                              height: ch(20),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                  txt: "Fitness Goals",
                                  fontSize: AppFontSize.f15,
                                  color: AppColor.white.withOpacity(0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(cw(10)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(14)),
                                  border: Border.all(color: AppColor.c252525),
                                  color: AppColor.transparent,
                                ),
                                child: Wrap(
                                  spacing: cw(10),
                                  runSpacing: ch(10),
                                  children: List.generate(
                                      model.fitnessGoals.length, (index) {
                                    return InputChip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(cw(8)),
                                          side: const BorderSide(
                                              color: AppColor.transparent),
                                        ),
                                        label: AppText(
                                            txt: model.fitnessGoals[index]
                                                .toString(),
                                            fontSize: AppFontSize.f16,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.normal),
                                        backgroundColor: AppColor.red,
                                        deleteIcon: const Icon(
                                          Icons.close,
                                          color: AppColor.white,
                                          size: 20,
                                        ),
                                        onDeleted: () {
                                          model.removeFitnessGoal(index);
                                        });
                                  }),
                                )),
                            SizedBox(
                              height: ch(10),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                  spacing: cw(10),
                                  runSpacing: ch(10),
                                  children: List.generate(
                                      model.allFitnessGoals.length, (index) {
                                    return _buildChip(
                                      label: model.allFitnessGoals[index],
                                      isSelected: model.fitnessGoals.contains(
                                          model.allFitnessGoals[index]),
                                      onTap: () {
                                        if (model.fitnessGoals.contains(
                                            model.allFitnessGoals[index])) {
                                          model.removeFitnessGoal(
                                              model.fitnessGoals.indexOf(model
                                                  .allFitnessGoals[index]));
                                        } else {
                                          model.fitnessGoals.add(
                                              model.allFitnessGoals[index]);
                                          model.notifyListeners();
                                        }
                                      },
                                    );
                                  })),
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            SizedBox(
                              height: ch(30),
                            ),
                            AppButton(
                              onPressed: () {
                                log(model.fitnessGoals.toString());
                                log(model.bio);
                                model.updateProfile(context);
                              },
                              text: "Salva modifiche",
                            ),
                            SizedBox(
                              height: ch(40),
                            )
                          ],
                        ),
                      ),
                      if (model.isLoading)
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: Colors.black.withOpacity(0.0),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
        )),
      ),
    );
  }
}

Widget _buildChip({
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: cw(10), vertical: ch(7)),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.red : Colors.transparent,
        borderRadius: BorderRadius.circular(cw(8)),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColor.c252525,
          width: 1,
        ),
      ),
      child: AppText(
          txt: label,
          color: AppColor.cFFFFFF, // Text color
          fontSize: AppFontSize.f15,
          fontWeight: FontWeight.w500),
    ),
  );
}
