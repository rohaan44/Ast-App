import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/sub_screen/status_feedback/status_feedback_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class StatusFeedbackView extends StatelessWidget {
  const StatusFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<StatusFeedbackController>(context);
    return Scaffold(
      body: AppDismissKeyboard(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: AppDismissKeyboard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ch(50),
                ),
                Row(
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
                    const Spacer(),

                    SizedBox(
                        width: cw(158),
                        child: customSlider(4, 3, AppColor.cFFFFFF)),
                    const Spacer()
                  ],
                ),
                SizedBox(
                  height: ch(40),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: "Stato e feedback",
                            fontSize: AppFontSize.f20,
                            fontWeight: FontWeight.w500,
                            color: AppColor.cFFFFFF,
                            height: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ch(8),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt:
                                "Raccontaci come ti sei sentito questa settimana per\naiutare il tuo coach a modificare il tuo piano.",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.cFFFFFF.withOpacity(0.5),
                            height: 1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ch(51),
                      ),
                      AppText(
                        txt: "Energia settimanale",
                        fontSize: AppFontSize.f19,
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF,
                        height: 1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: ch(5),
                      ),
                      DottedSliderLines(
                        titles: const ['Basso', 'Moderare', 'Alto'],
                        currentIndex: model.energyIndex,
                        onChanged: (index) {
                          model.setEnergyIndex(index);
                        },
                      ),
                      // const DottedSliderLines(
                      //   titles: ['Basso', 'Moderare', 'Alto'],
                      // ),
                      SizedBox(
                        height: ch(30),
                      ),
                      AppText(
                        txt: "Recupero ",
                        fontSize: AppFontSize.f19,
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF,
                        height: 1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: ch(5),
                      ),
                      DottedSliderLines(
                        titles: const ['Basso', 'Moderare', 'Alto'],
                        currentIndex: model.recoveryIndex,
                        onChanged: (index) {
                          model.setRecoveryIndex(index);
                        },
                      ),
                      SizedBox(
                        height: ch(30),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<StatusFeedbackController>(
                              builder: (context, model, child) {
                            return InkWell(
                                onTap: () {
                                  model.toggleAgreed();
                                },
                                child: !model.isAgreed
                                    ? Icon(
                                        Icons.check_box_outline_blank,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.5),
                                        size: ch(22),
                                      )
                                    : SvgPicture.asset(
                                        AssetUtils.writeCheckIcon,
                                        color: AppColor.red,
                                        height: ch(20),
                                        width: ch(20),
                                      ));
                          }),
                          SizedBox(
                            width: cw(10),
                          ),
                          Expanded(
                            child: AppText(
                              txt:
                                  "Confermo di aver letto e accettato i Termini di utilizzo e l’Informativa sulla privacy.",
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.5),
                              height: 1.3,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: cw(20),
                      ),
                      primaryTextField(
                          controller: model.notesController,
                          border: InputBorder.none,
                          maxLines: 5,
                          textFieldHeight: ch(150),
                          hintText:
                              "Vuoi lasciare un messaggio al tuo allenatore?"),
                      SizedBox(
                        height: ch(114),
                      ),
                      Consumer<StatusFeedbackController>(
                          builder: (context, model, child) {
                        return AppButton(
                            isButtonEnable:
                                model.notesController.text.isNotEmpty,
                            buttonColor: AppColor.primary,
                            onPressed: () {
                              final flowData = context
                                  .read<FlowDataProvider>()
                                  .addOrUpdateFlow(flowTag: checkInDiet, data: {
                                "notes": model.notesController.text,
                                "recovery": model.recoveryIndex == 0
                                    ? "basic"
                                    : model.recoveryIndex == 1
                                        ? "moderate"
                                        : "high",
                                "energy": model.energyIndex == 0
                                    ? "basic"
                                    : model.energyIndex == 1
                                        ? "moderate"
                                        : "high",
                              });

                              Navigator.pushNamed(
                                context,
                                RoutePaths.reviewYourCheckInView,
                              );
                            },
                            text: "Avanti",
                            fontSize: 16,
                            textColor: AppColor.cFFFFFF,
                            fontWeight: FontWeight.w600);
                      }),
                      SizedBox(
                        height: ch(40),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DottedSliderLines extends StatelessWidget {
  final List<String> titles;
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const DottedSliderLines({
    super.key,
    required this.titles,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SliderTheme(
              data: SliderThemeData(
                trackHeight: ch(2),
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
                thumbColor: AppColor.primary,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: cw(8)),
                overlayColor: AppColor.primary.withOpacity(0.2),
                overlayShape: RoundSliderOverlayShape(overlayRadius: cw(16)),
                tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: cw(4)),
                activeTickMarkColor: AppColor.primary,
                inactiveTickMarkColor: Colors.white24,
                trackShape: const RoundedRectSliderTrackShape(),
              ),
              child: Slider(
                activeColor: AppColor.primary,
                inactiveColor: Colors.white24,
                value: currentIndex.toDouble(),
                min: 0,
                max: (titles.length - 1).toDouble(),
                divisions: titles.length - 1,
                onChanged: (value) {
                  onChanged(value.round());
                },
              ),
            ),
          ],
        ),

        SizedBox(height: ch(8)),

        // Titles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            titles.length,
            (index) => SizedBox(
              width: cw(60),
              child: AppText(
                txt: titles[index],
                textAlign: TextAlign.center,
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.w500,
                color:
                    index == currentIndex ? AppColor.primary : Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
