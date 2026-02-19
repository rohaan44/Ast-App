import 'dart:developer';
import 'dart:ui';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/coach_profile_setting/coach_profile_setting_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CoachProfileSettingView extends StatelessWidget {
  const CoachProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<CoachProfileSettingController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!model.isFirstFetchDone && !model.isLoading) {
        model.getCoachProfile(context);
      }
    });
    return AppDismissKeyboard(
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                child: Column(
                  children: [
                    centerTextBackIconAppbar(
                        context: context, text: "Profilo e impostazioni"),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: ch(20)),

                            /// Profile Image Section
                            Consumer<CoachProfileSettingController>(
                                builder: (context, model, child) {
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(cw(5)),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(cw(90)),
                                      border: Border.all(color: AppColor.red),
                                    ),
                                    child: CircleAvatar(
                                      radius: cw(55),
                                      backgroundColor: AppColor.grey,
                                      backgroundImage: model
                                                      .coachProfile['avatar'] !=
                                                  null ||
                                              model.coachProfile['user']
                                                      ?['avatar'] !=
                                                  null
                                          ? NetworkImage(model
                                                  .coachProfile['avatar'] ??
                                              model.coachProfile['user']
                                                  ?['avatar']) as ImageProvider
                                          : const AssetImage(
                                              AssetUtils.profilePic),
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
                                                    color: Colors.red),
                                                SizedBox(width: 8),
                                                Text("Elimina foto",
                                                    style: TextStyle(
                                                        color: Colors.red)),
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
                              );
                            }),

                            SizedBox(height: ch(16)),

                            /// Name
                            Consumer<CoachProfileSettingController>(
                              builder: (context, model, child) {
                                final root = model.coachProfile;
                                final profile =
                                    root["profile"] as Map<String, dynamic>?;
                                final userMap =
                                    profile?["user"] as Map<String, dynamic>?;

                                final String user =
                                    userMap?["name"]?.toString() ?? "";

                                final String role =
                                    userMap?["role"]?.toString() ??
                                        "Allenatore di forza certificato";

                                return Column(
                                  children: [
                                    AppText(
                                      txt:
                                          user.isNotEmpty ? user : "Allenatore",
                                      fontSize: AppFontSize.f24,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.cFFFFFF,
                                    ),
                                    SizedBox(height: ch(8)),
                                    AppText(
                                      txt: role,
                                      fontSize: AppFontSize.f18,
                                      color: AppColor.white.withOpacity(0.7),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: ch(15)),

                            /// View Profile Button
                            AppButton(
                              onPressed: () {
                                log(model.coachProfile.toString());
                              },
                              width: cw(110),
                              height: ch(35),
                              borderRadius: cw(10),
                              buttonColor: AppColor.cEB5725,
                              text: "Visualizza profilo",
                              fontWeight: FontWeight.w500,
                              fontSize: AppFontSize.f15,
                              textColor: AppColor.cFFFFFF,
                            ),

                            SizedBox(height: ch(32)),

                            /// Menu Items
                            _buildMenuItem(
                              icon: AssetUtils.user,
                              label: "Modifica profilo",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.coachEditProfileView);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.infoIcon,
                              label: "Informazioni sull'allenatore",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.coachInfoView);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.integrationIcon,
                              label: "Integrazione",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.integrationScreen);
                              },
                            ),

                            _buildMenuItem(
                              icon: AssetUtils.integrationIcon,
                              label: "Selettore della lingua",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.languageSelectedScreen);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.lock,
                              iconColor: AppColor.cEB5725,
                              label: "Cambiare la password",
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RoutePaths.resetPasswordEmailScreen);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.cardIcon,
                              label: "Pagamenti e Royalties",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.plansRoyaltiesScreen);
                              },
                            ),
                            Consumer<CoachProfileSettingController>(
                                builder: (context, model, child) {
                              return _buildNotificationItem(model);
                            }),
                            _buildMenuItem(
                              icon: AssetUtils.exit,
                              label: "Esci",
                              labelColor: AppColor.cFF3A2F,
                              onTap: () {
                                model.logout(context);
                              },
                            ),

                            SizedBox(height: ch(40)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<CoachProfileSettingController>(
                builder: (context, model, child) {
              if (!model.isLoading) return const SizedBox.shrink();
              return Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.red,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    Color? labelColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(cw(12)),
        child: Container(
          height: ch(59),
          padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(16)),
          decoration: BoxDecoration(
            color: AppColor.cFFFFFF.withOpacity(0.05),
            borderRadius: BorderRadius.circular(cw(12)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon, color: iconColor),
              SizedBox(width: cw(16)),
              AppText(
                txt: label,
                fontSize: AppFontSize.f16,
                color: labelColor ?? AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(CoachProfileSettingController model) {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(12)),
      child: Container(
        height: ch(59),
        padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(16)),
        decoration: BoxDecoration(
          color: AppColor.cFFFFFF.withOpacity(0.05),
          borderRadius: BorderRadius.circular(cw(12)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AssetUtils.bellIcon, color: AppColor.cEB5725),
            SizedBox(width: cw(16)),
            AppText(
                txt: "Notifiche",
                fontSize: AppFontSize.f16,
                color: AppColor.white),
            const Spacer(),
            Switch(
              value: model.isNotification,
              onChanged: (value) => model.isNotification = value,
              activeColor: AppColor.c5CCC6F,
            ),
          ],
        ),
      ),
    );
  }
}
