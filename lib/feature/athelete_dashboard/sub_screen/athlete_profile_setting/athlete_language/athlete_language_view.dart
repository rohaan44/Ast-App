import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_language/athlete_language_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AthleteLanguageView extends StatelessWidget {
  const AthleteLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(
                  context: context, text: "Selettore della lingua"),
              SizedBox(height: ch(15)),

              AppText(
                txt: "Scegli la lingua preferita per l'interfaccia dell'app.",
                color: AppColor.white.withOpacity(0.7),
                fontSize: AppFontSize.f15,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: ch(25)),

              Expanded(
                child: Consumer<AthleteLanguageController>(
                  builder: (context, model, _) => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.languages.length,
                    itemBuilder: (context, index) {
                      final lang = model.languages[index];
                      final selected = lang == model.selectedLanguage;

                      return Padding(
                        padding: EdgeInsets.only(bottom: ch(12)),
                        child: InkWell(
                          onTap: () => model.selectLanguage(lang),
                          borderRadius: BorderRadius.circular(cw(12)),
                          child: Container(
                            height: ch(60),
                            padding: EdgeInsets.symmetric(horizontal: cw(16)),
                            decoration: BoxDecoration(
                              color: AppColor.cFFFFFF.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(cw(12)),
                              border: Border.all(
                                color: selected
                                    ? AppColor.c5CCC6F
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
                                Icon(
                                  selected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: selected
                                      ? AppColor.c5CCC6F
                                      : AppColor.white.withOpacity(0.4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              AppButton(
                onPressed: () {
                  // Save selected language logic here
                },
                text: "Salva e continua",
                buttonColor: AppColor.cFFFFFF,
                textColor: AppColor.black,
                height: ch(52),
                borderRadius: cw(30),
              ),

              SizedBox(height: ch(30)),
            ],
          ),
        ),
      ),
    );
  }
}
