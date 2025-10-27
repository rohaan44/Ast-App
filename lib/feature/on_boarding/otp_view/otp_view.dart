import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/otp_view/otp_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
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

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AssetUtils.backArrow,
                  ),
                ),
                SvgPicture.asset(
                  AssetUtils.logoIcon,
                  width: cw(60),
                  height: ch(25),
                ),
                const SizedBox.shrink()
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
                              txt: "Verifica OTP",
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
                                  "Inserisci il codice di verifica che abbiamo inviato\n alla tua email kel**@gmail.com.   ",
                              fontSize: AppFontSize.f18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.5),
                              height: 1.5,
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<OtpController>(
                                builder: (context, model, child) {
                              return primaryTextField(
                                keyboardType:TextInputType.number,
                                  obscureText: true,
                                  border: InputBorder.none,
                                  hintText: "Inserisci il codice qui",
                                  // prefixIcon: const Icon(CupertinoIcons.lock),
                                  // suffixIcon: Icon(Icons.remove_red_eye),
                                  controller: model.otpTextController);
                            }),
                            SizedBox(
                              height: ch(25),
                            ),
                            AppButton(
                              onPressed: () {
                                final data =context.read<FlowDataProvider>().getFlowData(customerOnboarding);
                                if (data!["value"]=="Tutor") {
                             Navigator.pushNamedAndRemoveUntil(context,
                                    RoutePaths.tutorMainScreen, (route) => false);
                                
                                }else{
                                  Navigator.pushNamedAndRemoveUntil(context,
                                    RoutePaths.dateOfBirth, (route) => false);
                             

                                }
                                 },
                              text: "Verifica",
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  txt: "Non hai ricevuto il codice?",
                                  color: AppColor.white.withOpacity(0.50),
                                  fontSize: AppFontSize.f15,
                                ),
                                AppText(
                                  txt: "Invia di nuovo il codice",
                                  color: AppColor.white,
                                  fontSize: AppFontSize.f15,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ])))
      ]),
    ));
  }
}
