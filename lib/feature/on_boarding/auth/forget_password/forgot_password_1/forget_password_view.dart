import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/auth/forget_password/forgot_password_1/forget_password_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ForgetPasswordController>();

    return Scaffold(
        body: AppDismissKeyboard(
      child: Stack(children: [
        Container(
            padding: EdgeInsets.all(cw(20)),
            height: ch(150),
            decoration: const BoxDecoration(gradient: AppGradients.redGradient),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left logo
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, RoutePaths.signIn, (route) => false),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // small tap area
                    child: SvgPicture.asset(
                      AssetUtils.backArrow,
                      height: ch(20),
                      width: cw(20),
                    ),
                  ),
                ),
                Expanded(
                  child: SvgPicture.asset(
                    AssetUtils.logoIcon,
                    width: cw(60),
                    height: ch(25),
                  ),
                ),
                SizedBox(
                  width: cw(40),
                )
              ],
            )),
        SizedBox(
          height: ch(114),
        ),
        Padding(
            padding: EdgeInsets.only(top: ch(114)),
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cw(25)),
                        topRight: Radius.circular(cw(25)))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ch(20),
                            ),
                            AppText(
                              txt: "Password dimenticata",
                              fontSize: AppFontSize.f20,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cFFFFFF,
                              height: 1,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            AppText(
                              txt:
                                  "Inserisci la tua email per reimpostare la password",
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                              height: 1.5,
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<ForgetPasswordController>(
                                builder: (context, model, child) {
                              return primaryTextField(
                                  prefixIcon:
                                      SvgPicture.asset(AssetUtils.emailIcon),
                                  suffixIcon: model.isEmailValid
                                      ? SvgPicture.asset(
                                          AssetUtils.isValidate,
                                          width: cw(13.3),
                                          height: ch(13.3),
                                        )
                                      : null,
                                  keyboardType: TextInputType.emailAddress,
                                  // obscureText: true,
                                  inputFormatters: [],
                                  border: InputBorder.none,
                                  hintText: "Indirizzo E-mail",
                                  controller: model.emailController);
                            }),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<ForgetPasswordController>(
                                builder: (context, model, child) {
                              return AppButton(
                                isButtonEnable: model.isEmailValid,
                                // isLoading: model.isLoading,
                                onPressed: () {
                                  // if (role == "Tutor") {
                                  // } else {
                                  //   final data = context
                                  //       .read<FlowDataProvider>()
                                  //       .getFlowData(customerSignIn);
                                  //   final email = data?["email"] ?? "";
                                  model.sendOtp(
                                    context,
                                    model.emailController.text,
                                  );
                                  // }
                                },
                                text: "Reimpostare la password",
                              );
                            }),
                            SizedBox(
                              height: ch(25),
                            ),
                          ],
                        ),
                      ))
                    ])))
      ]),
    ));
  }
}
