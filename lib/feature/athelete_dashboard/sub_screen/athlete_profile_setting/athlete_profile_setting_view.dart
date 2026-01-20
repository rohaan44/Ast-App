import 'dart:ui';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_profile_setting_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/show_dialog/show_dialog.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AthleteProfileSettingView extends StatelessWidget {
  const AthleteProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AthleteProfileSettingController>();

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
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutePaths.dashboardHomeScreen, (route) => false);
                        },
                        context: context,
                        text: "Profilo e impostazioni"),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: ch(20)),

                            /// Profile Image Section
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(cw(5)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(cw(90)),
                                    border: Border.all(color: AppColor.red),
                                  ),
                                  child: CircleAvatar(
                                    radius: cw(55),
                                    backgroundColor: AppColor.grey,
                                    backgroundImage:
                                        const AssetImage(AssetUtils.profilePic),
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
                            ),

                            SizedBox(height: ch(16)),

                            /// Name
                            AppText(
                              txt: "Timothy Doe",
                              fontSize: AppFontSize.f24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.cFFFFFF,
                            ),

                            SizedBox(height: ch(8)),

                            /// Subtext
                            AppText(
                              txt: "Allenatore di forza certificato",
                              fontSize: AppFontSize.f15,
                              color: AppColor.white.withOpacity(0.7),
                            ),

                            SizedBox(height: ch(15)),

                            /// View Profile Button
                            AppButton(
                              onPressed: () {},
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
                                    context, RoutePaths.athleteEditProfile);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.infoIcon,
                              label: "Informazioni sull'allenatore",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.athleteInfoScreen);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.integrationIcon,
                              label: "Integrazione",
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RoutePaths.athleteIntegrationScreen);
                              },
                            ),

                            _buildMenuItem(
                              icon: AssetUtils.integrationIcon,
                              label: "Selettore della lingua",
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RoutePaths.athleteLanguageSelectedScreen);
                              },
                            ),
                            _buildMenuItem(
                              icon: AssetUtils.lock,
                              iconColor: AppColor.cEB5725,
                              label: "Cambiare la password",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.resetPasswordScreen);
                              },
                            ),
                            // _buildMenuItem(
                            //   icon: AssetUtils.cardIcon,
                            //   label: "Pagamenti e Royalties",
                            //   onTap: () {
                            //     Navigator.pushNamed(
                            //         context, RoutePaths.plansRoyaltiesScreen);
                            //   },
                            // ),
                            _buildNotificationItem(model),
                            _buildMenuItem(
                              icon: AssetUtils.exit,
                              label: "Esci",
                              labelColor: AppColor.cFF3A2F,
                              onTap: () {
                                showAlertDialog(
                                  context: context,
                                  message: "Sei sicuro di voler uscire?",
                                  onContinue: () {
                                    model.logout(context);
                                    Navigator.pop(context);
                                  },
                                );
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
            if (model.isLoading)
              Positioned.fill(
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
              ),
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

  Widget _buildNotificationItem(AthleteProfileSettingController model) {
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
