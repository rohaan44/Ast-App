import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/auth/sign_in/sign_in_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/custom_checkbox/custom_checkbox.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignInController>();

    return Scaffold(
      body: AppDismissKeyboard(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ch(25)),
                // --- Header ---
                Row(
                  children: [
                    SvgPicture.asset(AssetUtils.walkthroughIcon),
                    // const Spacer(),
                    // InkWell(
                    //   onTap: () {
                    //
                    //   },
                    //   child: const Icon(
                    //     Icons.close,
                    //     color: AppColor.cFFFFFF,
                    //     size: 20,
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height: ch(30)),
                AppText(
                  txt: "Bentornato",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                ),
                SizedBox(height: ch(12)),
                AppText(
                  txt: "Accedi al tuo account per continuare",
                  fontSize: AppFontSize.f18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.5),
                  height: 1.5,
                ),
                SizedBox(height: ch(25)),
                primaryTextField(
                  hintText: "Indirizzo E-mail",
                  prefixIcon: SvgPicture.asset(AssetUtils.emailIcon),
                  suffixIcon: provider.isEmailValid
                      ? SvgPicture.asset(
                          AssetUtils.isValidate,
                          width: cw(13.3),
                          height: ch(13.3),
                        )
                      : null,
                  controller: provider.emailController,
                  // onChanged: (_) => provider.onTextChanged(),
                  fillColor: AppColor.c161616,
                  border: InputBorder.none,
                  inputFormatters: [],
                ),
                SizedBox(height: ch(16)),
                primaryTextField(
                  hintText: "Password",
                  obscureText: provider.isObsecure,
                  prefixIcon: SvgPicture.asset(AssetUtils.lockIcon),
                  suffixIcon: IconButton(
                    icon: Icon(
                      provider.isObsecure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.cFFFFFF,
                    ),
                    onPressed: () {
                      provider.isObsecure = !provider.isObsecure;
                    },
                  ),
                  controller: provider.passwordController,
                  onChanged: (_) => provider.onTextChanged(),
                  border: InputBorder.none,
                  inputFormatters: [],
                ),
                if (provider.passwordController.text.length >= 8 &&
                    !provider.isPasswordValid) ...[
                  SizedBox(height: ch(8)),
                  AppText(
                    txt:
                        "La password deve contenere almeno 8 caratteri, una\nlettera, un numero e un carattere speciale.",
                    fontSize: 12,
                    height: 1.5,
                    color: AppColor.red,
                    maxLines: 2,
                  ),
                ],
                SizedBox(
                  height: ch(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CusttomCheckBox(
                            isCheck: provider.isCheck,
                            onTap: () {
                              provider.isCheck = !provider.isCheck;
                            }),
                        SizedBox(
                          width: cw(8),
                        ),
                        AppText(
                          txt: "Ricordare",
                          height: 1.5,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.cFFFFFF.withOpacity(0.5),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutePaths.forgetPassword);
                      },
                      child: AppText(
                        txt: "Ha dimenticato la password",
                        height: 1.5,
                        color: AppColor.white,
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ch(24)),
                AppButton(
                  isLoading: provider.isLoading,
                  // isButtonEnable: provider.isButtonEnabled,
                  borderRadius: cw(50),
                  onPressed: () async {
                    final flowProvider = context.read<FlowDataProvider>();
                    final success = await provider.login(
                        context,
                        provider.emailController.text,
                        provider.passwordController.text);
                    if (success) {
                      flowProvider
                          .addOrUpdateFlow(flowTag: customerSignIn, data: {
                        "email": provider.emailController.text,
                        "from": "sign_in",
                        "role": provider.role,
                      });
                    }
                  },
                  text: "Accedi",
                ),
                SizedBox(height: ch(50)),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: AppColor.c1E1E1E),
                    ),
                    SizedBox(width: cw(8)),
                    AppText(
                      txt: "O",
                      fontSize: 16,
                      color: AppColor.cFFFFFF.withOpacity(0.3),
                    ),
                    SizedBox(width: cw(8)),
                    const Expanded(
                      child: Divider(color: AppColor.c1E1E1E),
                    ),
                  ],
                ),
                SizedBox(height: ch(50)),
                AppButton(
                  showIcon: true,
                  icon: SvgPicture.asset(
                    AssetUtils.googleIcon,
                    width: cw(20),
                    height: ch(20),
                  ),
                  borderRadius: cw(50),
                  onPressed: () {},
                  buttonColor: AppColor.c151515,
                  text: "Continua con Google",
                  textColor: AppColor.white,
                ),
                SizedBox(height: ch(16)),
                AppButton(
                  showIcon: true,
                  icon: SvgPicture.asset(
                    AssetUtils.appleIcon,
                    width: cw(25),
                    height: ch(25),
                  ),
                  borderRadius: cw(50),
                  onPressed: () {},
                  buttonColor: AppColor.c151515,
                  text: "Continua con Apple",
                  textColor: AppColor.white,
                ),
                SizedBox(height: ch(80)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutePaths.signUp);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Non hai un account?",
                            style: const TextStyle(
                                color: AppColor.cFFFFFF,
                                fontSize: 14,
                                height: 1.5),
                            children: [
                              WidgetSpan(
                                  child: SizedBox(
                                width: cw(5),
                              )),
                              const TextSpan(
                                text: "Registrati",
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    height: 1.5),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
