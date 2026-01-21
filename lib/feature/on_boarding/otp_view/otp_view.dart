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
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OtpController>();
    final data =
        context.read<FlowDataProvider>().getFlowData(customerOnboarding);
    final role = data?["value"] ?? "";

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
                              color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                              height: 1.5,
                            ),
                            SizedBox(
                              height: ch(25),
                            ),
                            primaryTextField(
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                maxLength: 6,
                                border: InputBorder.none,
                                hintText: "Inserisci il codice qui",
                                controller: model.otpTextController),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<OtpController>(
                                builder: (context, model, child) {
                              return AppButton(
                                isButtonEnable: model.isButtonEnable,
                                isLoading: model.isLoading,
                                onPressed: () {
                                  if (role == "Tutor") {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      RoutePaths.tutorMainScreen,
                                      (route) => false,
                                    );
                                  } else {
                                    final data = context
                                        .read<FlowDataProvider>()
                                        .getFlowData(customerSignIn);
                                    final email = data?["email"] ?? "";
                                    model.verifyOtp(
                                      context,
                                      email,
                                      model.otpTextController.text,
                                    );
                                  }
                                },
                                text: "Verifica",
                              );
                            }),
                            SizedBox(
                              height: ch(25),
                            ),
                            Consumer<OtpController>(
                              builder: (context, model, child) {
                                return Center(
                                  child: CountdownTimer(
                                    key: ValueKey(model.endTime),
                                    controller: model.countdownTimerController,
                                    endTime: model.endTime!,
                                    widgetBuilder:
                                        (_, CurrentRemainingTime? time) {
                                      if (time == null) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppText(
                                              txt:
                                                  "Non hai ricevuto il codice? ",
                                              color: AppColor.white
                                                  .withValues(alpha: 0.50),
                                              fontSize: AppFontSize.f15,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                model
                                                    .clearAndFocusPinCodeField();
                                                model.startTimerAgainSafely();
                                                final data = context
                                                    .read<FlowDataProvider>()
                                                    .getFlowData(
                                                        customerSignIn);
                                                final email =
                                                    data?["email"] ?? "";
                                                model.resendOtp(context, email);
                                              },
                                              child: AppText(
                                                txt: "Invia di nuovo il codice",
                                                color: AppColor.white,
                                                fontSize: AppFontSize.f15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        );
                                      }

                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppText(
                                            txt:
                                                "Invia nuovamente il codice in ",
                                            color: AppColor.white
                                                .withValues(alpha: 0.50),
                                            fontSize: AppFontSize.f15,
                                          ),
                                          AppText(
                                            txt:
                                                "${model.formatTimer(time.min)}:${model.formatTimer(time.sec)}",
                                            color: AppColor.white,
                                            fontSize: AppFontSize.f15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ))
                    ])))
      ]),
    ));
  }
}
