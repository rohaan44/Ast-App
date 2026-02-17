import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s3/tutor_certificate_section_s3_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorCertificateSectionS3View extends StatelessWidget {
  const TutorCertificateSectionS3View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS3Controller>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(24)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ch(12)),
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
                            txt: "Promemoria di rinnovo",
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
                  SizedBox(height: ch(24)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ch(16), horizontal: cw(12)),
                    decoration: BoxDecoration(
                        color: AppColor.c1E1E1E, // matching your dark theme
                        borderRadius: BorderRadius.circular(cw(20)),
                        border: Border.all(
                            color: AppColor.cE04900.withOpacity(0.4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: "Prossime scadenze (prossimi 30 giorni)",
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                        AppText(
                          txt: "12",
                          fontSize: AppFontSize.f15,
                          fontWeight: FontWeight.w400,
                          color: AppColor.cFF8D28,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  SizedBox(
                    height: ch(40), // give enough height for your tabs
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.filterTabs.length,
                      itemBuilder: (context, index) {
                        final isSelected = model.selectedTab == index;
                        return Padding(
                          padding: EdgeInsets.only(right: cw(8)),
                          child: GestureDetector(
                            onTap: () => model.setSelectedTab(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(12), vertical: ch(8)),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.primary
                                    : AppColor.c252525,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: AppText(
                                  txt: model.filterTabs[index],
                                  color: AppColor.cFFFFFF,
                                  fontSize: AppFontSize.f16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ch(16), horizontal: cw(12)),
                    decoration: BoxDecoration(
                        color: AppColor.cFF8D28
                            .withOpacity(0.2), // matching your dark theme
                        borderRadius: BorderRadius.circular(cw(20)),
                        border: Border.all(
                            color: AppColor.cE04900.withOpacity(0.4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AssetUtils.bellIcon),
                        SizedBox(
                          width: cw(10),
                        ),
                        Expanded(
                          child: AppText(
                            txt:
                                "I certificati di 3 studenti sono già scaduti: agisci subito.",
                            fontSize: AppFontSize.f15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.cFFFFFF,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  ListView.builder(
                    shrinkWrap:
                        true, // ✅ tells ListView to take only the space it needs
                    physics:
                        const NeverScrollableScrollPhysics(), // ✅ disables internal scrolling
                    // padding: EdgeInsets.only(top: 16, bottom: 16),
                    itemCount: model.students.length,
                    itemBuilder: (context, index) {
                      final student = model.students[index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(cw(16)),
                            margin: EdgeInsets.only(bottom: ch(24)),
                            decoration: BoxDecoration(
                              color: AppColor.c1E1E1E,
                              borderRadius: BorderRadius.circular(cw(16)),
                              border: Border.all(
                                  color: AppColor.cE04900.withOpacity(0.4)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Avatar
                                Container(
                                  height: ch(48),
                                  width: cw(48),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.c2A2A2A,
                                  ),
                                  alignment: Alignment.center,
                                  child: AppText(
                                    txt: student["initials"]!,
                                    fontSize: AppFontSize.f16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.white,
                                  ),
                                ),
                                SizedBox(width: cw(12)),

                                // Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: student["name"]!,
                                        fontSize: AppFontSize.f16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white,
                                      ),
                                      SizedBox(height: ch(4)),
                                      Container(
                                        width: cw(106),
                                        height: ch(22),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(cw(30)),
                                            color: AppColor.cFF8D28),
                                        child: Center(
                                          child: AppText(
                                            txt: student["due"]!,
                                            fontSize: AppFontSize.f14,
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: ch(4)),
                                      AppText(
                                        txt: "Corso: ${student["course"]!}",
                                        fontSize: AppFontSize.f14,
                                        color: AppColor.white.withOpacity(0.7),
                                      ),
                                      SizedBox(height: ch(4)),
                                      AppText(
                                        txt:
                                            "Scadenza del certificato precedente: ${student["certificateExpiry"]!}",
                                        fontSize: AppFontSize.f14,
                                        color: AppColor.white.withOpacity(0.7),
                                        height: 1.2,
                                      ),
                                    ],
                                  ),
                                ),

                                // Status Badge
                                Padding(
                                  padding: EdgeInsets.only(bottom: ch(32)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: ch(5), horizontal: cw(10)),
                                    decoration: BoxDecoration(
                                      color: AppColor.transparent,
                                      border:
                                          Border.all(color: AppColor.cFF8D28),
                                      borderRadius:
                                          BorderRadius.circular(cw(30)),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        txt: student["status"]!,
                                        color: AppColor.white,
                                        fontSize: AppFontSize.f14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: ch(24)),
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutePaths.tutorCertificateSectionS4View);
                    },
                    text: "Rinnova tutto",
                    color: AppColor.white,
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
