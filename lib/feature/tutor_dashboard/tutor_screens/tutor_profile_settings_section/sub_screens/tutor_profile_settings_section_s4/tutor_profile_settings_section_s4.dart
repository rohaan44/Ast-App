import 'package:ast_official/feature/tutor_dashboard/tutor_main_screen.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/sub_screens/tutor_profile_settings_section_s4/tutor_profile_settings_section_s4_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorProfileSettingsSectionS4View extends StatefulWidget {
  const TutorProfileSettingsSectionS4View({super.key});

  @override
  State<TutorProfileSettingsSectionS4View> createState() =>
      _TutorProfileSettingsSectionS4ViewState();
}

class _TutorProfileSettingsSectionS4ViewState
    extends State<TutorProfileSettingsSectionS4View> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorProfileSettingsSectionS4Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: ch(12)),

                // HEADER
                Row(
                  children: [
                    IconButton(
                      highlightColor: AppColor.transparent,
                      focusColor: AppColor.transparent,
                      splashColor: AppColor.transparent,
                      icon: SvgPicture.asset(AssetUtils.backArrow),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: AppText(
                          txt: "Selettore della lingua",
                          fontSize: AppFontSize.f16 + 4,
                          isItalic: true,
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: cw(40)),
                  ],
                ),

                SizedBox(height: ch(16)),

                AppText(
                  txt:
                      "Scegli la lingua preferita per l’interfaccia\ndell’app.",
                  fontSize: AppFontSize.f16,
                  color: AppColor.white.withOpacity(0.7),
                  textAlign: TextAlign.center,
                  height: 1.4,
                ),

                SizedBox(height: ch(24)),

                Expanded(
                  child: ListView.builder(
                    itemCount: model.languages.length,
                    itemBuilder: (context, index) {
                      final lang = model.languages[index];
                      final isSelected = lang == model.selectedLanguage;
                      return Padding(
                        padding: EdgeInsets.only(bottom: ch(12)),
                        child: InkWell(
                          onTap: () {
                            setState(() => model.selectedLanguage = lang);
                          },
                          borderRadius: BorderRadius.circular(cw(12)),
                          child: Container(
                            height: ch(59),
                            padding: EdgeInsets.symmetric(horizontal: cw(16)),
                            decoration: BoxDecoration(
                              color: AppColor.cFFFFFF.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(cw(12)),
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.green
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  txt: lang,
                                  fontSize: AppFontSize.f16,
                                  color: AppColor.white,
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColor.green,
                                    size: cw(22),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: ch(12)),

                AppButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TutorMainScreen()),
                      (route) => false,
                    );
                  },
                  text: "Salva e continua",
                  fontSize: AppFontSize.f18,
                ),

                SizedBox(height: ch(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
