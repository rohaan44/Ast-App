import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/home_screen_view.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/success/success_controller.dart';
// import 'package:ast_official/feature/on_boarding/payment_flow/wallet/wallet_controller.dart';
// import 'package:ast_official/feature/on_boarding/select_role/select_role_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/dotted_line_divider.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final flowData =
        context.read<FlowDataProvider>().getFlowData(certificationRenew);
    final isRenew = flowData != null ? flowData["isRenew"] ?? false : false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Consumer<SuccessController>(
            builder: (context, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: ch(40)),
                  Text("🎉", style: TextStyle(fontSize: AppFontSize.f40)),
                  const SizedBox(height: 16),

                  if (context
                          .read<FlowDataProvider>()
                          .getFlowData(customerOnboarding)!["value"] ==
                      "athlete") ...[
                    AppText(
                      txt: "Abbonamento attivato con successo",
                      fontSize: AppFontSize.f24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                      textAlign: TextAlign.center,
                    ),
                  ] else ...[
// ✅ Title
                    if (isRenew) ...[
                      AppText(
                        txt: "Tasse di rinnovo della licenza presentate",
                        fontSize: AppFontSize.f24,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                        textAlign: TextAlign.center,
                      ),
                    ] else
                      AppText(
                        txt: "Canoni di licenza presentati",
                        fontSize: AppFontSize.f24,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                        textAlign: TextAlign.center,
                      ),
                  ],

                  SizedBox(height: ch(10)),

                  if (context
                          .read<FlowDataProvider>()
                          .getFlowData(customerOnboarding)!["value"] ==
                      "athlete") ...[
                    AppText(
                      txt:
                          "Ora hai accesso ai tuoi piani personalizzati, ai check-in settimanali e alla chat con il coach.",
                      fontSize: AppFontSize.f18,
                      color: AppColor.white.withOpacity(0.6),
                      textAlign: TextAlign.center,
                      height: 1.5,
                    ),
                  ] else ...[
                    AppText(
                      txt:
                          "Ora inizia la tua formazione e inizia a guadagnare con Smartly. Iniziamo a creare il tuo primo certifica",
                      fontSize: AppFontSize.f18,
                      color: AppColor.white.withOpacity(0.6),
                      textAlign: TextAlign.center,
                      height: 1.5,
                    ),
                  ],

                  SizedBox(height: ch(30)),
                  DottedDivider(
                    color: AppColor.white.withOpacity(0.1),
                  ),
                  SizedBox(height: ch(20)),

                  // Payment details
                  _detailRow(
                      "ID PAGAMENTO",
                      provider.paymentId,
                      "Importo pagato",
                      context
                                  .read<FlowDataProvider>()
                                  .getFlowData(customerOnboarding)!["value"] ==
                              "athlete"
                          ? "€79.00"
                          : isRenew
                              ? "€249.00"
                              : "€549.00"),

                  SizedBox(height: ch(20)),

                  _detailRow("DATA e ORA", provider.dateTime, "", ""),

                  SizedBox(height: ch(35)),

                  // Payment method box
                  Container(
                    width: double.infinity,
                    height: ch(54),
                    padding: EdgeInsets.symmetric(
                      horizontal: cw(16),
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.c252525,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: "Metodo di pagamento",
                          fontSize: AppFontSize.f15,
                          color: AppColor.white.withOpacity(0.5),
                        ),
                        if (context.read<FlowDataProvider>().getFlowData(
                                customerOnboarding)!["selectMethod"] ==
                            "apple") ...[
                          SvgPicture.asset(
                            AssetUtils.appleIcon,
                            height: ch(30),
                          )
                        ] else if (context.read<FlowDataProvider>().getFlowData(
                                customerOnboarding)!["selectMethod"] ==
                            "stripe") ...[
                          SvgPicture.asset(AssetUtils.stripeIcon)
                        ] else if (context.read<FlowDataProvider>().getFlowData(
                                customerOnboarding)!["selectMethod"] ==
                            "paypal") ...[
                          SvgPicture.asset(AssetUtils.paypalIcon,
                              height: ch(30))
                        ] else if (context.read<FlowDataProvider>().getFlowData(
                                customerOnboarding)!["selectMethod"] ==
                            "google") ...[
                          SvgPicture.asset(AssetUtils.googleIcon,
                              height: ch(30))
                        ],
                      ],
                    ),
                  ),

                  SizedBox(height: ch(20)),
                  DottedDivider(
                    color: AppColor.white.withOpacity(0.1),
                    spaceWidth: cw(2),
                    dashWidth: cw(5),
                  ),

                  const Spacer(),

                  // Bottom buttons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left button
                      Expanded(
                        child: AppButton(
                            buttonColor: AppColor.white.withOpacity(0.1),
                            text: "Scarica ricevuta",
                            textColor: AppColor.white,
                            onPressed: () {}),
                      ),

                      SizedBox(width: ch(12)),

                      // Right button
                      Expanded(
                        child: AppButton(
                          text: "Fato",
                          onPressed: () {
                            final athleteFlowData = context
                                .read<FlowDataProvider>()
                                .getFlowData(customerOnboarding);
                            final role = athleteFlowData != null
                                ? athleteFlowData["value"] ?? ""
                                : "";

                            if (role == "coach") {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutePaths.coachMainScreenView,
                                (route) => false,
                              );
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutePaths.dashboardView,
                                arguments: const HomeScreenview(),
                                (route) => false,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ch(10),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _detailRow(
  String leftTitle,
  String leftValue,
  String rightTitle,
  String rightValue,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Left side
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            txt: leftTitle,
            fontSize: AppFontSize.f15,
            color: AppColor.white.withOpacity(0.4),
          ),
          SizedBox(height: ch(15)),
          AppText(
            txt: leftValue,
            fontSize: AppFontSize.f16,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        ],
      ),

      // Right side (optional)
      if (rightTitle.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              txt: rightTitle,
              fontSize: AppFontSize.f15,
              color: AppColor.white.withOpacity(0.4),
            ),
            SizedBox(height: ch(15)),
            AppText(
              txt: rightValue,
              fontSize: AppFontSize.f16,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            ),
          ],
        ),
    ],
  );
}
