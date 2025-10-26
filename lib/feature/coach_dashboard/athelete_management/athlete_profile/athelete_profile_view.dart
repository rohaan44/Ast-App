import 'dart:developer';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_profile/athlete_profile_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/graphs&chart/line_chart.dart';
import 'package:ast_official/ui_molecules/graphs&chart/simple_difference_chart.dart';
import 'package:ast_official/ui_molecules/graphs&chart/weight_graph.dart';
import 'package:ast_official/utils/app_divider.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AthleteProfileView extends StatefulWidget {
  final athlete;
  const AthleteProfileView({super.key, required this.athlete});

  @override
  State<AthleteProfileView> createState() => _AthleteProfileViewState();
}

class _AthleteProfileViewState extends State<AthleteProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        context.read<AthleteProfileController>().setTab(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(20)),

              // 🔙 Back Button
              GestureDetector(
                onTap: () {
                  log(widget.athlete.toString());
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AssetUtils.backArrow),
              ),

              SizedBox(height: ch(20)),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: cw(116),
                    height: ch(116),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(AssetUtils.avatar),
                    ),
                  ),
                  SizedBox(width: cw(20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: widget.athlete["name"],
                        color: AppColor.white,
                        fontSize: AppFontSize.f24 - 4,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: ch(5)),
                      AppText(
                        txt: "età: 30",
                        color: AppColor.white,
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(height: ch(5)),
                      AppText(
                        txt: "Genere: Maschio",
                        color: AppColor.white,
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: ch(10)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ch(2), horizontal: cw(8)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColor.green),
                        ),
                        child: AppText(
                          txt: "Attiva",
                          color: AppColor.green,
                          fontSize: AppFontSize.f12 + 5,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: ch(24)),
              appDivider(),
              SizedBox(height: ch(20)),

              // 🔘 Buttons Row
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      textColor: AppColor.white,
                      buttonColor: AppColor.red,
                      text: "Messaggio",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: cw(12)),
                  Expanded(
                    child: AppButton(
                      isBorder: true,
                      borderWidth: 1,
                      borderColor: AppColor.c1E1E1E,
                      buttonColor: AppColor.transparent,
                      text: "Nuovo Piano",
                      textColor: AppColor.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: ch(20)),
              TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                padding: EdgeInsets.zero, // 🔥 removes internal padding
                labelPadding: EdgeInsets.symmetric(horizontal: cw(16)),
                labelColor: AppColor.white,
                unselectedLabelColor: AppColor.white.withOpacity(0.4),
                indicatorColor: AppColor.red,
                labelStyle: TextStyle(
                  fontSize: AppFontSize.f15,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SF-Pro",
                ),
                tabs: const [
                  Tab(text: "Panoramica"),
                  Tab(text: "Progressi"),
                  Tab(text: "Check-in"),
                  Tab(text: "Piani"),
                  Tab(text: "Documenti"),
                ],
              ),

              SizedBox(height: ch(20)),

              // 🔹 Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _overviewTab(),
                    _progressTab(),
                    _checkinTab(),
                    _plansTab(),
                    _documentsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer<AthleteProfileController>(
        builder: (context, controller, _) {
          return controller.tabIndex == 2 ||
                  controller.tabIndex == 3 ||
                  controller.tabIndex == 4
              ? Padding(
                  padding: EdgeInsets.only(bottom: ch(60)),
                  child: AppButton(
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.black,
                        offset: Offset(-48, 17),
                        blurRadius: 60,
                      )
                    ],
                    width: cw(162.5),
                    textColor: AppColor.background,
                    buttonColor: AppColor.white,
                    text: controller.tabIndex == 2
                        ? "+ Nuovo check-in"
                        : controller.tabIndex == 3
                            ? "+ Nuovo piano"
                            : controller.tabIndex == 4
                                ? ""
                                : null,
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w600,
                    onPressed: () {},
                  ),
                )
              : const SizedBox.shrink(); // ✅ return empty widget
        },
      ),
    );
  }

  // ----------------------- Tab Data Sections ----------------------------
  Widget _overviewTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔸 Personal Data
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataCard(
                title: "Dati personali",
                values: const [
                  {"label": "Peso", "value": "60kg"},
                  {"label": "Altezza", "value": "6’1"},
                  {"label": "Età", "value": "24"},
                  {"label": "Genere", "value": "Maschio"},
                ],
              ),
              _dataCard(
                imagePaths: [
                  AssetUtils.docIcon,
                  AssetUtils.docIcon,
                  AssetUtils.docIcon,
                ],
                title: "Documenti",
                values: const [
                  {"label": "Sottoscrizione", "value": "Pro"},
                  {"label": "Scade", "value": "October 20"},
                ],
              ),
            ],
          ),
          SizedBox(height: ch(20)),

          // 🔸 Progress Chart Placeholder
          Container(
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
                  txt: "Progressi",
                  fontSize: AppFontSize.f19,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: ch(10)),
                const ProgressChartWidget(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppText(
                    txt: "85%",
                    fontSize: AppFontSize.f20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ch(20)),

          // 🔸 Check-in Preview
          Container(
            padding: EdgeInsets.all(cw(16)),
            decoration: BoxDecoration(
              color: AppColor.c1E1E1E,
              borderRadius: BorderRadius.circular(cw(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: "Check-in",
                  fontSize: AppFontSize.f18,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: ch(8)),
                AppText(
                  txt: "Time: MAR 12",
                  fontSize: AppFontSize.f15,
                  color: AppColor.white.withOpacity(0.5),
                ),
                SizedBox(height: ch(8)),
                Row(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: cw(8)),
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(AssetUtils.avatar),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ch(10)),
                AppText(
                  txt: "Al suggerito:",
                  fontSize: AppFontSize.f15,
                  color: AppColor.c2C2C32,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  txt: "Aumenta le calorie",
                  fontSize: AppFontSize.f16,
                  color: AppColor.white,
                ),
              ],
            ),
          ),

          SizedBox(
            height: ch(50),
          )
        ],
      ),
    );
  }

  Widget _dataCard({
    required String title,
    required List<Map<String, String>> values,
    List<String>? imagePaths, // 👈 optional (nullable) list of images/icons
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: cw(8)),
        padding: EdgeInsets.all(cw(25)),
        decoration: BoxDecoration(
          color: AppColor.c1E1E1E,
          borderRadius: BorderRadius.circular(cw(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Title
            AppText(
              txt: title,
              fontSize: AppFontSize.f19,
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: ch(12)),

            // 🔹 Image Row (only visible if not null or empty)
            if (imagePaths != null && imagePaths.isNotEmpty)
              Row(
                children: imagePaths
                    .map(
                      (path) => Padding(
                        padding: EdgeInsets.only(right: cw(6)),
                        child: Image.asset(
                          path,
                          height: ch(20),
                          width: cw(20),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                    .toList(),
              ),

            if (imagePaths != null && imagePaths.isNotEmpty)
              SizedBox(height: ch(12)),

            // 🔹 Key-value pairs
            for (var item in values)
              Padding(
                padding: EdgeInsets.symmetric(vertical: ch(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      txt: item["label"]!,
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: AppFontSize.f16 - 2,
                    ),
                    AppText(
                      txt: item["value"]!,
                      color: AppColor.white,
                      fontWeight: FontWeight.normal,
                      fontSize: AppFontSize.f16 - 2,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _progressTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Card 1: Weight Gain
              activityCard(
                  width: cw(100),
                  height: ch(100),
                  isGradient: true,
                  child: activityInfoContent(
                      topText: 'Passo',
                      mainValue: '5 kg',
                      changeValue: '+0.2kg',
                      isPositiveChange: true)),

              // Card 2: Percentage Loss
              activityCard(
                  width: cw(100),
                  height: ch(100),
                  isGradient: true,
                  child: activityInfoContent(
                      topText: 'Grasso',
                      mainValue: '15.2 %',
                      changeValue: '-0.5kg',
                      isPositiveChange: false)),

              // Card 3: Weight Gain
              activityCard(
                  width: cw(100),
                  height: ch(100),
                  isGradient: true,
                  child: activityInfoContent(
                      topText: 'Passo',
                      mainValue: '5 kg',
                      changeValue: '+0.2kg',
                      isPositiveChange: true)),
            ],
          ),
          SizedBox(
            height: ch(20),
          ),
          const WeightProgressCard(),
          SizedBox(
            height: ch(20),
          ),
          AppText(
            txt: "Strength Pics",
            fontSize: AppFontSize.f19,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: ch(20),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aiBodyWithLabel(),
              SizedBox(
                width: cw(10),
              ),
              Center(
                child: Container(
                  width: cw(160),
                  height: ch(118),
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.05), // A translucent background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: ch(10)),
                    child: const SimpleComparisonBarChart(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ch(20),
          ),
          analysisCard(
            title: "Analisi IA",
            subtitle: "−0,5 kg in 6 settimane, grasso -3%",
          ),
          SizedBox(
            height: ch(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                txt: "Nota dell'allenatore",
                fontSize: AppFontSize.f19,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
              GestureDetector(
                onTap: () {},
                child: AppText(
                  txt: "+ Aggiungi note",
                  fontSize: AppFontSize.f19,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: ch(20),
          ),
          analysisCard(
            title: "Nota dell'allenatore",
            subtitle: "Ottimi progressi, continuate con la costanza!",
            isBorder: true,
            borderColor: AppColor.white,
            backgroundColor: AppColor.transparent,
            textColor: AppColor.white,
          ),
          SizedBox(
            height: ch(50),
          ),
        ],
      ),
    );
  }

  Widget _checkinTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            txt: "Cronologia del check-in",
            fontSize: AppFontSize.f19,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: ch(20),
          ),
          checkInReviewCard(
            dateTime: "Sep 20, 2025 . 9:00 AM",
            statusText: "Revisionato",
            statusColor: AppColor.green,
            aiBody: aiBodyWithLabel(),
            peso: "60Kg",
            grasso: "22.5%",
            misure: "-1 inch",
            analysisTitle: "Analisi IA",
            analysisSubtitle: "−0,5 kg in 6 settimane, grasso -3%",
          ),
          SizedBox(
            height: ch(20),
          ),
          checkInReviewCard(
            dateTime: "Sep 20, 2025 . 9:00 AM",
            statusText: "In attesa di",
            statusColor: AppColor.yellow,
            aiBody: aiBodyWithLabel(),
            peso: "60Kg",
            grasso: "22.5%",
            misure: "-1 inch",
            analysisTitle: "Analisi IA",
            analysisSubtitle: "−0,5 kg in 6 settimane, grasso -3%",
          ),
        ],
      ),
    );
  }

  Widget checkInReviewCard({
    required String dateTime, // e.g. "Sep 20, 2025 . 9:00 AM"
    required String statusText, // e.g. "Revisionato"
    required Color statusColor, // e.g. AppColor.green
    required Widget aiBody, // e.g. aiBodyWithLabel()
    required String peso, // e.g. "60Kg"
    required String grasso, // e.g. "22.5%"
    required String misure, // e.g. "-1 inch"
    required String analysisTitle, // e.g. "Analisi IA"
    required String
        analysisSubtitle, // e.g. "−0,5 kg in 6 settimane, grasso -3%"
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: cw(15), vertical: ch(15)),
      width: cw(353),
      height: ch(284),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E,
        borderRadius: BorderRadius.circular(cw(20)),
        border: Border.all(width: 1, color: AppColor.cC6C6C6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header Row (Date + Status)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                txt: dateTime,
                fontSize: AppFontSize.f19,
                fontWeight: FontWeight.w600,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: ch(5), horizontal: cw(8)),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: statusColor),
                ),
                child: AppText(
                  txt: statusText,
                  color: AppColor.white,
                  fontSize: AppFontSize.f12 + 5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: ch(15)),

          // 🔹 Body Row (AI Image + Measurements)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aiBody, // Pass your aiBodyWithLabel() widget
              SizedBox(width: cw(20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  row("Peso:", peso),
                  SizedBox(height: ch(10)),
                  row("Grasso:", grasso),
                  SizedBox(height: ch(10)),
                  row("Misure:", misure),
                ],
              ),
            ],
          ),

          SizedBox(height: ch(20)),

          // 🔹 Bottom Analysis Card
          analysisCard(
            title: analysisTitle,
            subtitle: analysisSubtitle,
          ),
        ],
      ),
    );
  }

  Widget aiBodyWithLabel() {
    return Row(
      children: [
        Column(
          children: [
            Image.asset(
              AssetUtils.bodyFront,
              height: ch(90),
            ),
            SizedBox(
              height: ch(10),
            ),
            AppText(
              txt: "Fronte",
              color: AppColor.white.withOpacity(0.7),
              fontSize: AppFontSize.f15,
            )
          ],
        ),
        SizedBox(
          width: cw(5),
        ),
        Column(
          children: [
            Image.asset(
              AssetUtils.bodyBack,
              height: ch(90),
            ),
            SizedBox(
              height: ch(10),
            ),
            AppText(
              txt: "Indietro",
              color: AppColor.white.withOpacity(0.7),
              fontSize: AppFontSize.f15,
            )
          ],
        ),
      ],
    );
  }

  Widget row(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: cw(50),
          child: AppText(
            txt: label,
            color: AppColor.white.withOpacity(0.5),
            fontSize: AppFontSize.f15,
          ),
        ),
        SizedBox(
          width: cw(10),
        ),
        AppText(
          txt: value,
          textAlign: TextAlign.start,
          color: AppColor.white,
          fontSize: AppFontSize.f15,
        ),
      ],
    );
  }

  Widget _plansTab() => const Center(child: Text("Piani Tab"));

  Widget _documentsTab() => const Center(child: Text("Documenti Tab"));
}

Widget activityCard({
  required Widget child,
  bool isGradient = true,
  double borderRadius = 16,
  double borderWidth = 2,
  EdgeInsets? padding,
  double? width,
  ImageProvider? image,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: image != null
          ? DecorationImage(
              image: image,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColor.background.withOpacity(0.8), BlendMode.darken))
          : null,
      border: Border.all(
          width: isGradient == false ? 3 : 0,
          color: isGradient == false ? AppColor.c2C2C32 : AppColor.transparent),
      gradient: isGradient ? AppGradients.redGradient : null,
      color: isGradient ? null : AppColor.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: isGradient
        ? Padding(
            padding: EdgeInsets.all(borderWidth),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(borderRadius - 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          )
        : Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
  );
}

Widget analysisCard({
  required String title,
  required String subtitle,
  Color textColor = AppColor.white,
  bool isBorder = false,
  Color borderColor = AppColor.white,
  Color backgroundColor = AppColor.red,
}) {
  return Container(
    padding: EdgeInsets.all(cw(20)),
    height: ch(80),
    width: double.infinity,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(cw(20)),
      border: isBorder
          ? Border.all(
              color: borderColor,
              width: 1.5,
            )
          : null, // only show border if isBorder = true
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          txt: title,
          color: textColor,
          fontSize: AppFontSize.f18,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: ch(8)),
        AppText(
          txt: subtitle,
          color: textColor.withOpacity(0.9),
          fontSize: AppFontSize.f18,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}

Widget activityInfoContent({
  required String topText,
  required String mainValue,
  required String changeValue,
  required bool isPositiveChange,
}) {
  final Color changeColor =
      isPositiveChange ? const Color(0xff4CAF50) : const Color(0xffF44336);
  final IconData changeIcon =
      isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        txt: topText,
        color: Colors.white.withOpacity(0.7),
        fontSize: AppFontSize.f16,
      ),
      Center(
        child: AppText(
          txt: mainValue,
          color: Colors.white,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          Icon(
            changeIcon,
            color: changeColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            changeValue,
            style: TextStyle(
              color: changeColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ],
  );
}
