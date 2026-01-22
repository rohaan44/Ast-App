import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_integration/athlete_integration_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AthleteIntegrationView extends StatelessWidget {
  const AthleteIntegrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AthleteIntegrationController>();

    final Map<String, String> icons = {
      "Google Fit": AssetUtils.googleFitIcon,
      "Apple Health": AssetUtils.appleHealthIcon,
      "MyFitnessPal": AssetUtils.myFitnessPalIcon,
      "Strava": AssetUtils.stravaIcon,
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
           padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(context: context, text: "Integrazioni"),
            
              AppText(
                txt: "Connect your favorite apps to sync health & training data seamlessly.",
                color: AppColor.white.withOpacity(0.6),
                fontSize: AppFontSize.f15 + 1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ch(20)),
          
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: controller.connections.entries.map((entry) {
                      final name = entry.key;
                      final connected = entry.value;
          
                      return Container(
                        margin: EdgeInsets.only(bottom: ch(16)),
                        padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(14)),
                        decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(cw(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  icons[name]!,
                                  height: ch(28),
                                  width: cw(28),
                                ),
                                SizedBox(width: cw(14)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: name,
                                      fontSize: AppFontSize.f19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: ch(10),),
                                    AppText(
                                      txt: connected ? "Collegata" : "Non connesso",
                                      color: connected ? Colors.green : AppColor.white.withOpacity(0.5),
                                      fontSize: AppFontSize.f15 -2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Switch(
                              value: connected,
                              onChanged: (val) => controller.toggleConnection(name, val),
                              activeColor: Colors.green,
                              inactiveThumbColor: AppColor.white,
                              inactiveTrackColor: AppColor.white.withOpacity(0.2),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            AppButton(
                text: "Salva e continua",
                onPressed: () {
                  // controller.saveConnections();

                  Navigator.pop(context);
                },
              ),
            SizedBox(height: ch(40),)
            ],
          ),
        ),
      ),
    );
  }
}
