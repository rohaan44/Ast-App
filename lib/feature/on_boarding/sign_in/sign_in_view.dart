import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isEnbleBtn = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

    return Scaffold(
      body: AppDismissKeyboard(
        child: Stack(
          children: [
          
            // Container(
            //   padding: EdgeInsets.all(cw(20)),
            //   width: double.infinity,
            //   height: ch(300),
            //   decoration:
            //       const BoxDecoration(gradient: AppGradients.redGradient),
            //       child: Row(children: [
            //         SvgPicture.asset(AssetUtils.logoIcon),
            //         SizedBox( width: 190,
            //           child: customSlider(5, 1, AppColor.white)),
            //         SvgPicture.asset(AssetUtils.appCrossIcon)
            //       ],),
            //   // child: appBar(
            //   //     customSlider: Container(
            //   //   color: AppColor.white,
            //   // )),
            // ),
            Container(
              padding: EdgeInsets.all(cw(20)),
              height: ch(150),
              decoration: const BoxDecoration(gradient: AppGradients.redGradient),
              child:Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Left logo
    SvgPicture.asset(
      AssetUtils.logoIcon,
      width: cw(60),
      height: ch(25),
    ),

    SizedBox(width: cw(12)), // small gap

    // Slider takes available middle space
    Expanded(
      child: customSlider(5, 1, AppColor.white),
    ),

    SizedBox(width: cw(57)),

    // Right close icon
    GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        AssetUtils.appCrossIcon,
        // width: cw(10),
        // height: ch(18),
      ),
    ),
  ],
)

            ),
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
                            SizedBox(height: ch(20),),
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
                              fillColor: AppColor.c151515,
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
                              isButtonEnable: isEnbleBtn,
                              borderRadius: cw(50),
                              onPressed: () {
                                if (isEnbleBtn) {
                                  print("==>>> enble");
                                }
                              },
                              buttonColor: AppColor.cFFFFFF,
                              text: "Continua",
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
                                    color: AppColor.c151515,
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
                                    color: AppColor.c151515,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ch(50),
                            ),
                            AppButton(
                              showIcon: true,
                              icon: SvgPicture.asset(AssetUtils.googleIcon,width: cw(20),height: ch(20),),
                              borderRadius: cw(50),
                              onPressed: () {},
                              buttonColor: AppColor.c151515,
                              text: "Continua con Google",
                                                            textColor: AppColor.white,
                            ),
                            SizedBox(
                              height: ch(16),
                            ),
                            AppButton(
                              showIcon: true,
                              icon: SvgPicture.asset(AssetUtils.appleIcon,width: cw(25),height: ch(25),),
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
