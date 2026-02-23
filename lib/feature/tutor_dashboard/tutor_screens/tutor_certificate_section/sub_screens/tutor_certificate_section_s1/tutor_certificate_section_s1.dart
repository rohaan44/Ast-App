import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s1/tutor_certificate_section_s1_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:provider/provider.dart';

class TutorCertificateSectionS1View extends StatelessWidget {
  const TutorCertificateSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS1Controller>(context);
    final certificateData =
        context.watch<FlowDataProvider>().getFlowData(tutorCertificationFlow) ??
            {};

    // Extract data safely
    final coachName = certificateData['issuedTo'] is Map
        ? certificateData['issuedTo']['name'] ?? 'Unknown'
        : 'Unknown';
    final courseTitle = certificateData['course'] is Map
        ? certificateData['course']['title'] ?? 'Unknown Course'
        : 'Unknown Course';
    final issueDate = certificateData['issueDate'] != null
        ? certificateData['issueDate'].toString().split('T')[0]
        : '';
    final certificateNumber =
        certificateData['certificateNumber'] ?? 'Unknown String';

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
                      color: AppColor.c1E1E1E,
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
                        Padding(
                          padding: EdgeInsets.only(bottom: ch(32)),
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ch(24),
                  ),
                  Container(
                    padding: EdgeInsets.all(cw(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cw(10)),
                      border: Border.all(color: AppColor.c656565),
                      color: AppColor.c1E1E1E,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "Opzioni di rinnovo",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: ch(20)),
                        TextField(
                          controller: model.expiryDateController,
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText:
                                "Inserisci una nuova data di scadenza (YYYY-MM-DD)",
                            hintStyle: TextStyle(
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c8E8E8E.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppColor.c151515,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c252525, width: cw(1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ch(16), vertical: cw(16)),
                          ),
                        ),
                        SizedBox(height: ch(8)),
                        TextField(
                          controller: model.issueDateController,
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText:
                                "Data di emissione (YYYY-MM-DD) (Opzionale)",
                            hintStyle: TextStyle(
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c8E8E8E.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppColor.c151515,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c252525, width: cw(1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ch(16), vertical: cw(16)),
                          ),
                        ),
                        SizedBox(height: ch(8)),
                        TextField(
                          controller: model.noteController,
                          maxLines: 3,
                          style: const TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                            hintText: "Bio / Note",
                            hintStyle: TextStyle(
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.c8E8E8E.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppColor.c151515,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: AppColor.c252525, width: cw(1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ch(16), vertical: cw(16)),
                          ),
                        ),
                        SizedBox(height: ch(20)),
                        // File Picker
                        GestureDetector(
                          onTap: model.pickFile,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: cw(16), vertical: ch(12)),
                            decoration: BoxDecoration(
                              color: AppColor.c151515,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColor.c454545, width: cw(1)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.attach_file,
                                    color: AppColor.c8E8E8E),
                                SizedBox(width: cw(10)),
                                Expanded(
                                  child: AppText(
                                    txt: model.selectedFile != null
                                        ? model.selectedFile!.path
                                            .split('/')
                                            .last
                                        : "Carica file certificato",
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f14,
                                  ),
                                ),
                                if (model.selectedFile != null)
                                  GestureDetector(
                                    onTap: model.removeFile,
                                    child: Icon(Icons.close,
                                        color: AppColor.red, size: 20),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ch(20)),
                        _buildSwitchItem(model),
                        SizedBox(height: ch(14)),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  Container(
                    padding: EdgeInsets.all(cw(16)),
                    decoration: BoxDecoration(
                      color: AppColor.c1E1E1E,
                      borderRadius: BorderRadius.circular(cw(16)),
                      border: Border.all(color: AppColor.c6C6C6C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "Anteprima del certificato",
                          color: AppColor.white,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: ch(20)),
                        if (model.selectedFile != null)
                          Container(
                            height: ch(150),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.c151515,
                              borderRadius: BorderRadius.circular(cw(16)),
                            ),
                            child: Icon(Icons.insert_drive_file,
                                size: 50, color: AppColor.white),
                          )
                        else
                          Container(
                            padding: EdgeInsets.all(cw(16)),
                            decoration: BoxDecoration(
                              color: AppColor.c1E1E1E,
                              borderRadius: BorderRadius.circular(cw(16)),
                              border: Border.all(color: AppColor.c6C6C6C),
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
                                    txt: "QR",
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
                                        txt: certificateNumber,
                                        fontSize: AppFontSize.f16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white,
                                      ),
                                      SizedBox(height: ch(4)),
                                      AppText(
                                        txt:
                                            "Layout del certificato generato automaticamente",
                                        fontSize: AppFontSize.f14,
                                        color: AppColor.white.withOpacity(0.7),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: ch(24)),
                  AppButton(
                    onPressed: () => model.renewCertificate(context),
                    isButtonEnable: model.isFormValid,
                    isLoading: model.isLoading,
                    text: "Rinnovare il certificato",
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

Widget _buildSwitchItem(TutorCertificateSectionS1Controller model) {
  return Row(
    children: [
      AppText(
        txt: "Inviare una notifica via email allo\nstudente?",
        fontSize: AppFontSize.f16,
        color: AppColor.white,
      ),
      const Spacer(),
      Transform.scale(
        scale: 0.6, // Adjust scale to match desired size
        child: SizedBox(
          width: 28,
          height: 15,
          child: Switch(
            value: model.notifyStudent,
            onChanged: model.toggleNotifyStudent,
            activeColor: AppColor.c5CCC6F,
          ),
        ),
      ),
    ],
  );
}
