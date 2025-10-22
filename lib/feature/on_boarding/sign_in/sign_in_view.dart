import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // bool isEnbleBtn = nameController.text.isNotEmpty &&
    //     emailController.text.isNotEmpty &&
    //     passwordController.text.isNotEmpty;

    return Scaffold(
      body: AppDismissKeyboard(
        child: Stack(
          children: [
            onboaridngAppBar(
                context: context, activeSegments: 1, totalSegments: 6),
            Padding(
              padding: EdgeInsets.only(top: ch(114)),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        // height: 100.w,
                        width: 100.w,

                        padding: EdgeInsets.symmetric(horizontal: cw(20)),
                        decoration: BoxDecoration(
                            color: AppColor.background,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(cw(25)),
                                topRight: Radius.circular(cw(25)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ch(20),
                            ),
                            AppText(
                              txt: "Conosciamoci meglio",
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
                                  "Questo ci aiuta a personalizzare il tuo primo piano di\nallenamento e nutrizione.",
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.5),
                              height: 1.5,
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            primaryTextField(
                              border: InputBorder.none,
                              hintText: "Nome completo",
                              prefixIcon: const Icon(CupertinoIcons.person),
                              controller: nameController,
                              // SvgPicture.asset(
                              //   AssetUtils.backArrow,
                              //   height: ch(18),
                              // )),
                            ),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                              suffixIcon: SvgPicture.asset(
                                AssetUtils.isValidate,
                                width: cw(13.3),
                                height: ch(13.3),
                              ),
                              fillColor: AppColor.c161616,
                              border: InputBorder.none,
                              hintText: "Indirizzo E-mail",
                              prefixIcon: const Icon(CupertinoIcons.mail),
                              controller: emailController,
                            ),
                            //  SvgPicture.asset(
                            //   AssetUtils.backArrow,
                            //   height: ch(18),
                            // )),
                            SizedBox(
                              height: ch(16),
                            ),
                            primaryTextField(
                                obscureText: true,
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: const Icon(CupertinoIcons.lock),
                                // suffixIcon: Icon(Icons.remove_red_eye),
                                controller: passwordController),
                            SizedBox(
                              height: ch(24),
                            ),
                            AppButton(
                              // isButtonEnable: isEnbleBtn,
                              borderRadius: cw(50),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RoutePaths.otpView, (route) => false);
                              },
                              buttonColor: AppColor.cFFFFFF,
                              text: "Continua",
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.black,
                            ),
                            SizedBox(
                              height: ch(50),
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    height: 1,
                                    color: AppColor.c1E1E1E,
                                  ),
                                ),
                                SizedBox(
                                  width: cw(8),
                                ),
                                AppText(
                                  txt: "O",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.cFFFFFF.withOpacity(0.3),
                                  height: 1.5,
                                ),
                                SizedBox(
                                  width: cw(8),
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 1,
                                    color: AppColor.c1E1E1E,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ch(50),
                            ),
                            AppButton(
                              showIcon: true,
                              icon: SvgPicture.asset(
                                AssetUtils.googleIcon,
                                width: cw(20),
                                height: ch(20),
                              ),
                              borderRadius: cw(50),
                              onPressed: () {
                                // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false);
                              },
                              buttonColor: AppColor.c151515,
                              text: "Continua con Google",
                              textColor: AppColor.white,
                            ),
                            SizedBox(
                              height: ch(16),
                            ),
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
                            SizedBox(
                              height: ch(16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
