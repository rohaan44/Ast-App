import 'package:ast_official/feature/on_boarding/auth/forget_password/reset_password/reset_password_controller.dart';
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
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResetPasswordController>();
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
                  onTap: () => Navigator.pop(context),
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
                              txt: "Reimposta password",
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
                                  "Inserisci il tuo indirizzo email per cercare il tuo account",
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.5),
                              height: 1.5,
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<ResetPasswordController>(
                                builder: (context, model, child) {
                              return primaryTextField(
                                  maxLength: 10,
                                  obscureText: model.isObsecurePassword,
                                  prefixIcon: SvgPicture.asset(
                                    AssetUtils.lockIcon,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      model.isObsecurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColor.cFFFFFF,
                                    ),
                                    onPressed: () {
                                      model.isObsecurePassword =
                                          !model.isObsecurePassword;
                                    },
                                  ),
                                  inputFormatters: [],
                                  border: InputBorder.none,
                                  hintText: "Nuova parola d'ordine",
                                  // prefixIcon: const Icon(CupertinoIcons.lock),
                                  // suffixIcon: Icon(Icons.remove_red_eye),
                                  controller: model.passController);
                            }),
                            SizedBox(
                              height: ch(20),
                            ),
                            Consumer<ResetPasswordController>(
                                builder: (context, model, child) {
                              return primaryTextField(
                                  maxLength: 10,
                                  hintText: "Conferma parola d'ordine",
                                  obscureText: model.isObsecureConfirmPassword,
                                  border: InputBorder.none,
                                  prefixIcon: SvgPicture.asset(
                                    AssetUtils.lockIcon,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      model.isObsecureConfirmPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColor.cFFFFFF,
                                    ),
                                    onPressed: () {
                                      model.isObsecureConfirmPassword =
                                          !model.isObsecureConfirmPassword;
                                    },
                                  ),
                                  inputFormatters: [],
                                  controller: model.confirmPassController);
                            }),
                            Consumer<ResetPasswordController>(
                                builder: (context, model, child) {
                              return !model.isPasswordValid &&
                                      model.passController.text.isNotEmpty
                                  ? AppText(
                                      txt:
                                          "La password deve contenere almeno 8 caratteri, lettere, almeno un numero e almeno un carattere speciale.",
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.red,
                                      height: 1.5,
                                    )
                                  : const SizedBox.shrink();
                            }),
                            Consumer<ResetPasswordController>(
                                builder: (context, model, child) {
                              return !model.isConfirmPasswordValid &&
                                      model
                                          .confirmPassController.text.isNotEmpty
                                  ? AppText(
                                      txt: "Password non corrispondente",
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.red,
                                      height: 1.5,
                                    )
                                  : const SizedBox.shrink();
                            }),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<ResetPasswordController>(
                                builder: (context, model, child) {
                              return AppButton(
                                isLoading: model.isLoading,
                                isButtonEnable: model.isConfirmPasswordValid &&
                                    model.isPasswordValid,
                                onPressed: () {
                                  model.changePassword(context);
                                },
                                text: "Reimposta password",
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
