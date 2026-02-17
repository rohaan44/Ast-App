import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CoachRenewCertificationView extends StatelessWidget {
  const CoachRenewCertificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(
                  context: context, text: "Rinnovare la certificazione"),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                            AppText(
                              txt: "Allenatore di forza certificato",
                              color: AppColor.white,
                              fontSize: AppFontSize.f19,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(6)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  txt: "ID: NSCA-CPT-12345",
                                  color: AppColor.white.withOpacity(0.7),
                                  fontSize: AppFontSize.f14+5,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: cw(10), vertical: ch(4)),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: AppText(
                                    txt: "Attiva",
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f16-2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: ch(8)),
                            AppText(
                              txt: "Scade il: 25/12",
                              color: AppColor.white.withOpacity(0.6),
                              fontSize: AppFontSize.f16,
                            ),
                            SizedBox(height: ch(12)),
                            Container(
                              height: ch(6),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ch(25)),

                      _buildRenewStep(),

                      SizedBox(height: ch(25)),

                      // Renewal Fee
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
                              txt: "Tassa di rinnovo",
                              color: AppColor.white,
                              fontSize: AppFontSize.f20,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(10)),
                            AppText(
                              txt: "\$249 / anno",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(8)),
                            AppText(
                              txt: "Metodi di pagamento accettati",
                              color: AppColor.white.withOpacity(0.6),
                              fontSize: AppFontSize.f15,
                            ),
                            SizedBox(height: ch(8)),
                            Row(
                              children: [
                                SvgPicture.asset(AssetUtils.paypalIcon,
                                    height: ch(25)),
                                SizedBox(width: cw(10)),
                                SvgPicture.asset(AssetUtils.appleIcon,
                                    height: ch(25)),
                                SizedBox(width: cw(10)),
                                SvgPicture.asset(AssetUtils.stripeIcon,
                                    height: ch(25)),
                                SizedBox(width: cw(10)),
                                SvgPicture.asset(AssetUtils.googleIcon,
                                    height: ch(25)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ch(30)),

                      // Buttons
                      AppButton(
                        onPressed: () {
                          context.read<FlowDataProvider>().addOrUpdateFlow(
  flowTag: certificationRenew,
  data: {
    "isRenew": true,
  },
  
);

Navigator.pushNamedAndRemoveUntil(context, RoutePaths.chooseYourPlan, (route) => false);
                        },
                        text: "Rinnova ora",
                        textColor: AppColor.background,
                        buttonColor: AppColor.white,
                      ),
                      SizedBox(height: ch(14)),
                      AppButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutePaths.coachProfileSettingScreen, (route) => false);
                        },
                        isBorder: true,
                        text: "Salva progressi",
                        textColor: AppColor.white,
                        borderColor: AppColor.white.withOpacity(0.3),
                        buttonColor: AppColor.transparent,
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
    );
  }

  Widget _buildRenewStep() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ch(20), horizontal: cw(14)),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            txt: "Fasi di rinnovo",
            color: AppColor.white,
            fontSize: AppFontSize.f20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: ch(35)),
          stepRow(
            title: "Modulo di formazione completo",
            subtitle: "Guarda tutte le video lezioni",
            status: "Inizio",
            color: AppColor.c34C759,
          ),
          SizedBox(height: ch(30)),
          stepRow(
            title: "Supera il quiz",
            subtitle: "Punteggio minimo dell'80%",
            status: "Inizio",
            color: AppColor.c34C759,
          ),
          SizedBox(height: ch(30)),
          stepRow(
            title: "Carica caso di studio",
            subtitle: "Dimostra le tue capacità di coaching",
            status: "Caricamento",
            color: AppColor.c34C759,
          ),
          SizedBox(height: ch(30)),
          stepRow(
            title: "Paga la quota di rinnovo",
            subtitle: "Total: \$199",
            status: "Paga",
            color: AppColor.c34C759,
          ),
        ],
      ),
    );
  }
}

Widget stepRow({
  required String title,
  required String subtitle,
  required String status,
  required Color color,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: cw(18),
        backgroundColor: AppColor.c252525,
        child: AppText(
          txt: "D",
          color: AppColor.white,
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.f16,
        ),
      ),
      SizedBox(width: cw(12)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              txt: title,
              color: AppColor.white,
              fontSize: AppFontSize.f16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: ch(3)),
            AppText(
              txt: subtitle,
              color: AppColor.white.withOpacity(0.6),
              fontSize: AppFontSize.f15,
            ),
          ],
        ),
      ),
      AppText(
        txt: status,
        color: color,
        fontSize: AppFontSize.f15,
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}
