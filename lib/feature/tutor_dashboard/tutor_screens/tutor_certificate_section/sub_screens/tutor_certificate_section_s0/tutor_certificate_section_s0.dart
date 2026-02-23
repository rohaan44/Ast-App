import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s0/tutor_certificate_section_s0_controller.dart';
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
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';

class TutorCertificateSectionS0View extends StatelessWidget {
  const TutorCertificateSectionS0View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS0Controller>(context);
    final certificateData =
        context.watch<FlowDataProvider>().getFlowData(tutorCertificationFlow) ??
            {};

    // Extract data safeley
    final coachName = certificateData['issuedTo'] is Map
        ? certificateData['issuedTo']['name'] ?? 'Unknown'
        : 'Unknown';
    final courseTitle = certificateData['course'] is Map
        ? certificateData['course']['title'] ?? 'Unknown Course'
        : 'Unknown Course';
    final issueDate = certificateData['issueDate'] != null
        ? certificateData['issueDate'].toString().split('T')[0]
        : '';
    final expiryDate = certificateData['expiryDate'] != null
        ? certificateData['expiryDate'].toString().split('T')[0]
        : '';
    final status =
        (certificateData['status'] ?? 'Unknown').toString().toUpperCase();

    Color statusColor;
    if (status.toLowerCase() == 'active') {
      statusColor = AppColor.c34C759;
    } else if (status.toLowerCase() == 'pending') {
      statusColor = Colors.orange;
    } else if (status.toLowerCase() == 'expired') {
      statusColor = Colors.red;
    } else {
      statusColor = AppColor.c626262;
    }

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(20)),
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
                            txt: "Particolare dello studente",
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

                  // 🔹 Student Card
                  Container(
                    padding: EdgeInsets.all(cw(16)),
                    decoration: BoxDecoration(
                      color: AppColor.c151515,
                      borderRadius: BorderRadius.circular(cw(16)),
                      border:
                          Border.all(color: AppColor.cE04900.withOpacity(0.4)),
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
                            txt: coachName.isNotEmpty
                                ? coachName.substring(0, 2).toUpperCase()
                                : "JD",
                            fontSize: AppFontSize.f16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(width: cw(12)),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: coachName,
                                fontSize: AppFontSize.f16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt: "Corso: $courseTitle",
                                fontSize: AppFontSize.f14,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                              SizedBox(height: ch(4)),
                              AppText(
                                txt: "Data di completamento: $issueDate",
                                fontSize: AppFontSize.f14,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),

                        // Status Badge
                        Container(
                          height: ch(22),
                          // width: cw(59), // Let it wrap
                          padding: EdgeInsets.symmetric(
                              vertical: ch(5), horizontal: cw(10)),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(cw(30)),
                          ),
                          child: Center(
                            child: AppText(
                              txt: status,
                              color: AppColor.white,
                              fontSize: AppFontSize.f14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ch(28)),

                  // 🔹 Certificazione Section
                  Container(
                    // width: double.infinity,
                    padding: EdgeInsets.all(cw(14)),
                    decoration: BoxDecoration(
                      color: AppColor.c1E1E1E,
                      border: Border.all(color: AppColor.c6C6C6C),
                      borderRadius: BorderRadius.circular(cw(16)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "Certificazione",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: ch(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              txt: "Data di emissione: $issueDate",
                              fontSize: AppFontSize.f14,
                              color: AppColor.white.withOpacity(0.7),
                            ),
                            AppText(
                              txt: "Expiry Date: $expiryDate",
                              fontSize: AppFontSize.f14,
                              color: AppColor.white.withOpacity(0.7),
                            ),
                          ],
                        ),
                        SizedBox(height: ch(20)),

                        // QR
                        Center(
                          child: Image.asset(
                            AssetUtils.qrIcon, // your QR image
                          ),
                        ),

                        SizedBox(height: ch(20)),

                        // Buttons
                        AppButton(
                          onPressed: () {},
                          text: "Emettere certificato",
                          color: AppColor.white,
                          textColor: AppColor.black,
                        ),
                        SizedBox(height: ch(12)),
                        AppButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                RoutePaths.tutorCertificateSectionS1View);
                          },
                          text: "Rinnovare il certificato",
                          buttonColor: AppColor.cE04900,
                          textColor: AppColor.white,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ch(24)),
                  AppText(
                    txt: "Storia",
                    color: AppColor.white,
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: ch(10)),

                  // 🔹 Storia Section
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.storiaList.length,
                    itemBuilder: (context, index) {
                      final item = model.storiaList[index];

                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: ch(12)),
                        padding: EdgeInsets.all(cw(16)),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.c656565),
                          color: AppColor.c1E1E1E,
                          borderRadius: BorderRadius.circular(cw(16)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: "Pubblicato il ${item['published']}",
                                      fontSize: AppFontSize.f16,
                                      color: AppColor.cB3B3B3,
                                    ),
                                    SizedBox(height: ch(4)),
                                    AppText(
                                      txt: "Scaduto il ${item['expired']}",
                                      fontSize: AppFontSize.f14,
                                      color: AppColor.cB3B3B3,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: ch(22),
                                  width: cw(59),
                                  padding: EdgeInsets.symmetric(
                                      vertical: ch(5), horizontal: cw(10)),
                                  decoration: BoxDecoration(
                                    color: item["color"],
                                    borderRadius: BorderRadius.circular(cw(30)),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      txt: item["status"],
                                      color: AppColor.white,
                                      fontSize: AppFontSize.f14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: ch(40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
