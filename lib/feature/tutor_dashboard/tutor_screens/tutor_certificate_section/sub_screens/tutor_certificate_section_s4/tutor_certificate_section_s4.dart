import 'package:ast_official/feature/tutor_dashboard/tutor_main_screen.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/sub_screens/tutor_certificate_section_s4/tutor_certificate_section_s4_controller.dart';
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

class TutorCertificateSectionS4View extends StatelessWidget {
  const TutorCertificateSectionS4View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionS4Controller>(context);

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
                            txt: "Genera certificato",
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

                  _sectionContainer(
                    title: "Selezione degli studenti",
                    child: Column(
                      children: [
                        _buildSearchTextField(
                          hintText: "Cerca per nome o ID.",
                          svgIconPath: AssetUtils.searchIcon,
                        ),
                        SizedBox(height: ch(16)),
                        _buildDropdown(
                          hintText: "Seleziona uno studente",
                          items: model.students
                              .map((s) => s['name'].toString())
                              .toList(),
                          selectedValue: model.selectedStudent?['name'],
                          onChanged: (value) {
                            if (value != null) {
                              final student = model.students.firstWhere(
                                (s) => s['name'] == value,
                                orElse: () => model.students.first,
                              );
                              model.selectStudent(student);
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ch(20)),

                  _sectionContainer(
                    title: "Corso Information",
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(cw(14)),
                      decoration: BoxDecoration(
                        color: AppColor.c151515,
                        borderRadius: BorderRadius.circular(cw(12)),
                        border:
                            Border.all(color: AppColor.c252525, width: cw(1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            txt: "Corso: Padronanza della Nutrizione Sportiva",
                            fontSize: AppFontSize.f14 + 2,
                            color: AppColor.white,
                            height: 1.2,
                          ),
                          SizedBox(height: ch(6)),
                          AppText(
                            txt: "Durata: 12 settimane",
                            fontSize: AppFontSize.f14 + 2,
                            color: AppColor.white,
                            height: 1.2,
                          ),
                          SizedBox(height: ch(6)),
                          AppText(
                            txt: "Data di completamento: 22 settembre 2025",
                            fontSize: AppFontSize.f14 + 2,
                            color: AppColor.white,
                            height: 1.2,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: ch(20)),

                  _sectionContainer(
                    title: "Dettagli del certificato",
                    child: Column(
                      children: [
                        /// --- Certificate Type Dropdown ---
                        _buildDropdown(
                          hintText: "Seleziona Tipo di certificato",
                          items: model.randomCertificateTypes,
                          selectedValue: model.selectedCertificateType,
                          onChanged: model.selectCertificateType,
                        ),
                        SizedBox(height: ch(16)),
                        _buildTextField("Data di emissione"),
                        SizedBox(height: ch(16)),
                        _buildTextField("Data di scadenza"),
                        SizedBox(height: ch(16)),
                        _buildTextField("Note (facoltative)"),
                      ],
                    ),
                  ),

                  SizedBox(height: ch(20)),

                  /// --- Dynamic Certificate Preview ---
                  _sectionContainer(
                    title: "Anteprima del certificato",
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: cw(16), vertical: ch(24)),
                      decoration: BoxDecoration(
                        color: AppColor.c151515,
                        borderRadius: BorderRadius.circular(cw(12)),
                        border:
                            Border.all(color: AppColor.c252525, width: cw(1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            txt: "Accademia A.S.T.",
                            fontSize: AppFontSize.f16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.cFFA500,
                          ),
                          SizedBox(height: ch(8)),
                          AppText(
                            txt: model.selectedCertificateType ??
                                "Tipo di certificato non selezionato",
                            fontSize: AppFontSize.f14 + 2,
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                          ),
                          SizedBox(height: ch(12)),
                          AppText(
                            txt: model.studentName,
                            fontSize: AppFontSize.f16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                          SizedBox(height: ch(6)),
                          AppText(
                            txt: "per aver completato con successo il corso",
                            fontSize: AppFontSize.f14 + 2,
                            color: AppColor.cFFFFFF.withOpacity(0.7),
                          ),
                          SizedBox(height: ch(6)),
                          AppText(
                            txt: model.courseTitle,
                            fontSize: AppFontSize.f16,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: ch(20)),
                          Container(
                            height: ch(90),
                            width: cw(90),
                            decoration: BoxDecoration(
                              color: AppColor.c252525,
                              borderRadius: BorderRadius.circular(cw(12)),
                            ),
                            alignment: Alignment.center,
                            child: AppText(
                              txt: "QR",
                              fontSize: AppFontSize.f16,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(height: ch(16)),
                          AppText(
                            txt: "Certificato n. AST-2025-00923",
                            fontSize: AppFontSize.f14,
                            color: AppColor.cFFFFFF.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: ch(32)),

                  /// --- Generate Certificate Button ---
                  AppButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorMainScreen()),
                        (route) => false,
                      );
                    },
                    text: "Genera certificato",
                    color: AppColor.white,
                    textColor: AppColor.black,
                  ),

                  SizedBox(height: ch(32)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// --- Section Container ---
  Widget _sectionContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(cw(16)),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E,
        borderRadius: BorderRadius.circular(cw(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            txt: title,
            fontSize: AppFontSize.f16,
            fontWeight: FontWeight.w600,
            color: AppColor.white,
          ),
          SizedBox(height: ch(16)),
          child,
        ],
      ),
    );
  }

  /// --- Dropdown ---
  Widget _buildDropdown({
    required String hintText,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: ch(52),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: cw(16)),
      decoration: BoxDecoration(
        color: AppColor.c151515,
        borderRadius: BorderRadius.circular(cw(16)),
        border: Border.all(color: AppColor.c454545, width: cw(1)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: AppColor.c1E1E1E,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.white),
          hint: AppText(
            txt: hintText,
            color: AppColor.cFFFFFF.withOpacity(0.5),
            fontSize: AppFontSize.f15,
          ),
          style: const TextStyle(color: AppColor.white),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: AppText(
                txt: item,
                color: AppColor.white,
                fontSize: AppFontSize.f15,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  /// --- TextField ---
  Widget _buildTextField(String hintText) {
    return TextField(
      style: const TextStyle(color: AppColor.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: AppFontSize.f15,
          color: AppColor.cFFFFFF.withOpacity(0.5),
        ),
        filled: true,
        fillColor: AppColor.c151515,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.c454545, width: cw(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.c252525, width: cw(1)),
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(14)),
      ),
    );
  }

  /// --- Search Field ---
  Widget _buildSearchTextField({
    required String hintText,
    required String svgIconPath,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ch(8)),
      child: TextField(
        style: const TextStyle(color: AppColor.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: AppFontSize.f15,
            fontWeight: FontWeight.w400,
            color: AppColor.cFFFFFF.withOpacity(0.5),
          ),
          filled: true,
          fillColor: AppColor.c151515,
          prefixIcon: Padding(
            padding: EdgeInsets.all(cw(12)),
            child: SvgPicture.asset(
              svgIconPath,
              width: cw(20),
              height: ch(20),
              color: AppColor.white,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: cw(40),
            minHeight: ch(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.c454545, width: cw(1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.c252525, width: cw(1)),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: ch(16), vertical: cw(16)),
        ),
      ),
    );
  }
}
