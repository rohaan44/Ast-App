import 'dart:developer';

import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/payment_flow/wallet/wallet_controller.dart';
import 'package:ast_official/feature/on_boarding/select_role/select_role_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/app_divider.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/dotted_line_divider.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/payment_option_card/payment_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SelectRoleController>();
    final flowData =
        context.read<FlowDataProvider>().getFlowData(certificationRenew);
    final isRenew = flowData != null ? flowData["isRenew"] ?? false : false;

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          highlightColor: AppColor.transparent,
                          focusColor: AppColor.transparent,
                          splashColor: AppColor.transparent,
                          icon: SvgPicture.asset(AssetUtils.backArrow),
                          onPressed: () => Navigator.pop(context),
                        ),
                        SvgPicture.asset(AssetUtils.walkthroughIcon),
                        const SizedBox.shrink()
                      ],
                    ),
                    SizedBox(
                      height: ch(30),
                    ),
                    AppText(
                      txt: "Metodo di pagamento",
                      fontSize: AppFontSize.f24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.cFFFFFF,
                      height: 1,
                    ),
                    SizedBox(
                      height: ch(8),
                    ),
                    AppText(
                      txt: "Seleziona il tuo metodo di pagamento preferito.",
                      fontSize: AppFontSize.f18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: ch(40),
                    ),
                    Consumer<WalletController>(
                        builder: (context, model, child) {
                      return Column(
                        children: [
                          PaymentOptionCard(
                            id: 'stripe',
                            title: 'Paga con Stripe',
                            iconPath: AssetUtils.stripeIcon,
                            isSelected: model.selectedMethod == 'stripe',
                            onTap: () => model.selectMethod('stripe'),
                          ),
                          PaymentOptionCard(
                            id: 'apple',
                            title: 'Apple Pay',
                            iconPath: AssetUtils.appleIcon,
                            isSelected: model.selectedMethod == 'apple',
                            onTap: () => model.selectMethod('apple'),
                          ),
                          PaymentOptionCard(
                            id: 'paypal',
                            title: 'Paypal',
                            iconPath: AssetUtils.paypalIcon,
                            isSelected: model.selectedMethod == 'paypal',
                            onTap: () => model.selectMethod('paypal'),
                          ),
                          PaymentOptionCard(
                            id: 'google',
                            title: 'Google Pay',
                            iconPath: AssetUtils.googleIcon,
                            isSelected: model.selectedMethod == 'google',
                            onTap: () => model.selectMethod('google'),
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: ch(24),
                    ),
                    appDivider(),
                    SizedBox(
                      height: ch(20),
                    ),
                    if (context.read<SelectRoleController>().selectedRole ==
                        "Athlete") ...[
                      paymentSummaryCard("Piano", "Base", "Importo", "€79.00"),
                    ] else if (context
                            .read<SelectRoleController>()
                            .selectedRole ==
                        "Coach") ...[
                      if (isRenew) ...[
                        paymentSummaryCard("Rinnovo", "Rinnovo della licenza",
                            "Annuale", "€249.00")
                      ] else
                        paymentSummaryCard("Certificazione",
                            "Quota di certificazione", "Una tantum", "€599.00")
                    ],
                    const Spacer(),
                    AppButton(
                      onPressed: () {
                        if (model.selectedRole == "stripe") {
                          log("stripe");
                        } else if (model.selectedRole == "apple") {
                          log("apple");
                        } else if (model.selectedRole == "paypal") {
                          log("paypal");
                        } else if (model.selectedRole == "google") {
                          log("google");
                        }
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutePaths.successView, (route) => false);
                      },
                      text: "Paga ora",
                    ),
                    SizedBox(
                      height: ch(10),
                    )
                  ]))),
    );
  }
}

Widget paymentSummaryCard(
    String pkg, String pkgFees, String type, String price) {
  return Container(
      padding: EdgeInsets.all(cw(16)),
      height: ch(133),
      width: cw(353),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cw(16)),
        color: AppColor.c161616,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: pkg,
              fontSize: AppFontSize.f16,
              color: AppColor.white.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
            AppText(
              txt: type,
              fontSize: AppFontSize.f16,
              color: AppColor.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(
          height: ch(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: pkgFees,
              fontSize: AppFontSize.f16,
              color: AppColor.white.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
            AppText(
              txt: price,
              fontSize: AppFontSize.f16,
              color: AppColor.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(
          height: ch(10),
        ),
        DottedDivider(
          color: AppColor.white.withOpacity(0.1),
        ),
        SizedBox(
          height: ch(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Totale",
              fontSize: AppFontSize.f16,
              color: AppColor.white.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
            AppText(
              txt: price,
              fontSize: AppFontSize.f16,
              color: AppColor.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ]));
}
