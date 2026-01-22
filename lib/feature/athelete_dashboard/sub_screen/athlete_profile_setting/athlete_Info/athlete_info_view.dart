import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athlete_profile_setting/athlete_Info/athlete_info_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AthleteInfoView extends StatelessWidget {
  const AthleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AthleteInfoController>();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
           padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              centerTextBackIconAppbar(context: context, text: "Informazioni sull'allenatore"),
              Expanded(
                child: SingleChildScrollView(
                   
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                      padding: EdgeInsets.all(cw(5)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cw(90)),
                        border: Border.all(color: AppColor.red)
                      ),
                        child: CircleAvatar(
                          radius: cw(55),
                          // backgroundColor: AppColor.background,
                          backgroundImage:const AssetImage(AssetUtils.profilePic)
                        ),
                      ),
                                  
                      SizedBox(height: ch(20)),
                                  
                      /// NAME
                      AppText(
                        txt: "Timothy Doe",
                        fontSize: AppFontSize.f20 + 2,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                                  
                      SizedBox(height: ch(10)),
                                  
                      /// CERTIFICATION
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: cw(8), vertical: ch(3)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color:AppColor.c34C759),
                            ),
                            child:  AppText(
                              txt: "Certified",
                              color:AppColor.c34C759,
                              fontSize: AppFontSize.f14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: cw(8)),
                         AppText(
                            txt: "ID: NSCA-CPT-12345",
                            color: AppColor.white,
                              fontSize: AppFontSize.f14,
                          ),
                        ],
                      ),
                                  
                      SizedBox(height: ch(5)),
                      AppText(
                        txt: "Expires: 12/25",
                        color: AppColor.white.withOpacity(0.7),
                        fontSize: AppFontSize.f15,
                      ),
                                  
                      SizedBox(height: ch(30)),
                      Divider(color: AppColor.white.withOpacity(0.1), thickness: 1),
                                  
                      SizedBox(height: ch(20)),
                                  
                      /// ABOUT SECTION
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: "Su di me",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(10)),
                            AppText(
                              txt:
                                  "Allenatore esperto specializzato in forza e condizionamento, con la passione di aiutare gli atleti a raggiungere il loro pieno potenziale. "
                                  "Credo in un approccio olistico al fitness, che combina allenamento personalizzato, corretta alimentazione e resilienza mentale per ottenere risultati sostenibili.",
                              color: AppColor.white.withOpacity(0.8),
                              fontSize: AppFontSize.f15,
                              height: 1.5,
                            ),
                          ],
                        ),
                      ),
                                  
                      SizedBox(height: ch(20)),
                                  
                      /// CERTIFICATIONS
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              txt: "Certificazioni",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(10)),
                            _certItem("Certificazione A.S.T."),
                            _certItem("Specialista in nutrizione"),
                            _certItem("Rianimazione cardiopolmonare e primo soccorso"),
                          ],
                        ),
                      ),
                                  
                      SizedBox(height: ch(20)),
                                  
                      /// LINKED SECTION
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              txt: "Collegato all'Accademia A.S.T.™",
                              color: AppColor.white,
                              fontSize: AppFontSize.f16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: ch(8)),
                            AppText(
                              txt:
                                  "La tua certificazione è valida fino al 25/12.",
                              color: AppColor.white.withOpacity(0.7),
                              fontSize: AppFontSize.f15,
                            ),
                            SizedBox(height: ch(16)),
                            AppButton(
                              text: "Rinnovare la certificazione",
                              onPressed: () {
                                Navigator.pushNamed(context, RoutePaths.coachRenewCertificationView);
                              },
                              color: AppColor.white,
                              textColor: AppColor.black,
                            ),
                          ],
                        ),
                      ),
                                  
                      SizedBox(height: ch(20)),
                                  
                      AppButton(
                        textColor: AppColor.white,
                        text: "Modifica informazioni",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutePaths.coachProfileSettingScreen,(route) => false,);
                        },
                        buttonColor: AppColor.red,
                      ),
                      SizedBox(height: ch(15)),
                      AppButton(
                        isBorder: true,
                        text: "Carica documenti",
                        onPressed: () {},
                        textColor: AppColor.white,
                        buttonColor: AppColor.transparent,
                        borderColor: AppColor.white.withOpacity(0.7),
                      ),
                      SizedBox(height: ch(40)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _certItem(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: ch(8)),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xff34C759), size: 18),
          SizedBox(width: cw(10)),
          AppText(
            txt: title,
            color: AppColor.white.withOpacity(0.9),
            fontSize: AppFontSize.f15,
          ),
        ],
      ),
    );
  }
}
