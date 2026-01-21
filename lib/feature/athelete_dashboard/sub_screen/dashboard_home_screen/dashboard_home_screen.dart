import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen_controller.dart';
import 'package:ast_official/feature/on_boarding/walk_through/walk_through_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/global_refresh_indicator/global_refresh_indicator.dart';
import 'package:ast_official/ui_molecules/slide_able_button/slideable_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:ast_official/utils/shimmer.dart';
import 'package:ast_official/utils/simple_weight_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DashboardHomeScreenController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!model.isProfileFetched && !model.isLoading) {
        model.getProfileData(context);
      }
    });

    return GlobalSkeleton(
      isLoading: model.isLoading,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ch(86)),
            child: _appBar(
                title: model.profileData['fullName'] ?? "Anonymous",
                context: context)),
        body: GlobalRefreshIndicator(
          onRefresh: () => model.getProfileData(context, forceRefresh: true),
          child: SafeArea(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ch(16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: cw(20)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetUtils.cloudIcon, width: cw(20)),
                          SizedBox(
                            width: cw(7),
                          ),
                          AppText(
                            txt: "•",
                            color: AppColor.cFFFFFF,
                            fontSize: AppFontSize.f15,
                            height: 1.5,
                          ),
                          SizedBox(
                            width: cw(7),
                          ),
                          AppText(
                            txt: " 90°C pioggia leggera oggi.",
                            fontWeight: FontWeight.w200,
                            color: AppColor.cFFFFFF,
                            fontSize: AppFontSize.f16,
                            height: 1.5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ch(21),
                    ),
                    carouselSliderCard(_carouselController),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: cw(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: ch(12),
                          ),
                          walkingBox(),
                          SizedBox(
                            height: ch(24),
                          ),
                          circularGraph(),
                          SizedBox(
                            height: ch(24),
                          ),
                          nextMeal(),
                          SizedBox(
                            height: ch(24),
                          ),
                          Consumer<DashboardHomeScreenController>(
                              builder: (context, model, child) {
                            return SlideAbleButtonView(
                                buttonText: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: cw(30),
                                    ),
                                    AppText(
                                      txt: 'Scorri per vedere le alternative',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      width: cw(4),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: ch(12),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: ch(12),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: ch(12),
                                    ),
                                  ],
                                ),
                                buttonWidget: SvgPicture.asset(
                                    AssetUtils.handForwardIcon),
                                borderColor: AppColor.c1E1E1E,
                                activeColor: AppColor.transparent,
                                isFinished: model.processing,
                                onWaitingProcess: () {
                                  model.handleSlideComplete(context);
                                },
                                onFinish: () async {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Slide !")),
                                  );
                                });
                          }),
                          SizedBox(
                            height: ch(24),
                          ),
                          Container(
                            height: ch(49),
                            decoration: BoxDecoration(
                                color: AppColor.c1E1E1E,
                                borderRadius: BorderRadius.circular(cw(16))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: cw(16)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AssetUtils.uploadImg),
                                  SizedBox(
                                    width: cw(8),
                                  ),
                                  AppText(
                                    txt:
                                        'Non dimenticare di caricare le tue foto oggi!',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ch(20),
                          ),
                          const SimpleWeightChart(),
                          SizedBox(
                            height: ch(120),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

Widget _appBar({String title = "Anonymous", required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(
          height: ch(40),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.athleteProfileSetting);
              },
              child: Container(
                height: ch(50),
                width: cw(50),
                padding: EdgeInsets.all(cw(2)),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.c252525),
                    shape: BoxShape.circle,
                    color: AppColor.transparent),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.c252525),
                  child: const Center(
                    child: Icon(
                      Icons.person_2_rounded,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: cw(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: "Benvenuta",
                  fontWeight: FontWeight.w200,
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                  fontSize: AppFontSize.f19,
                  height: 1.5,
                ),
                AppText(
                  txt: title,
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                  fontSize: AppFontSize.f20,
                  height: 1.5,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: ch(50),
              width: cw(50),
              padding: EdgeInsets.all(cw(2)),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.c252525),
                  shape: BoxShape.circle,
                  color: AppColor.transparent),
              child: const Center(
                child: Icon(Icons.notifications_none_outlined),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget carouselSliderCard(CarouselSliderController controller) {
  return Consumer<DashboardHomeScreenController>(
    builder: (context, model, child) {
      return Column(
        children: [
          CarouselSlider(
            carouselController: controller,
            items: model.cardData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                child: buildCard(data, index),
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: ch(80),
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              clipBehavior: Clip.antiAlias,
              onPageChanged: (newIndex, reason) {
                model.setCarouselValue(newIndex);
              },
            ),
          ),
          SizedBox(
            height: ch(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              model.cardData.length,
              (index) => buildDot(model.carouselValue, index),
            ),
          ),
        ],
      );
    },
  );
}

Widget buildCard(Map data, int index) {
  switch (index) {
    case 0:
      return Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: cw(14)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cw(20)),
            gradient: AppGradients.redGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ch(38),
              width: cw(38),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.cDC251B),
                  gradient: AppGradients.redGradient),
              child: Center(
                  child: SvgPicture.asset(
                AssetUtils.dumbleIcon,
              )),
            ),
            SizedBox(
              width: cw(8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: data['title'] ?? '',
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  fontSize: 14,
                ),
                SizedBox(
                  height: ch(4),
                ),
                AppText(
                  txt: data['subTitle'] ?? '',
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.8),
                  fontSize: 12,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: ch(33),
              width: cw(65),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cw(50)),
                  color: AppColor.cD51E146E.withOpacity(0.43)),
              child: Center(
                child: AppText(
                  txt: "Inizia",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      );

    case 1:
      return Container(
        width: cw(353),
        padding: EdgeInsets.symmetric(horizontal: cw(14)),
        decoration: BoxDecoration(
          color: AppColor.c1E1E1E.withOpacity(0.2),
          borderRadius: BorderRadius.circular(cw(20)),
          border: Border.all(color: AppColor.c252525),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AppText(
                      txt: data['title'] ?? '',
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(
                  height: ch(4),
                ),
                AppText(
                  txt: data['subTitle'] ?? '',
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF.withOpacity(0.8),
                  fontSize: 12,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: ch(32),
              width: cw(32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cw(20)),
                  color: AppColor.c1D1D1B.withOpacity(0.5),
                  border: Border.all(color: AppColor.c252525)),
              child: Center(
                  child: SvgPicture.asset(
                AssetUtils.closeIcon,
              )),
            ),
            SizedBox(
              width: cw(8),
            ),
          ],
        ),
      );

    case 2:
      return Container(
        width: cw(353),
        padding: EdgeInsets.symmetric(horizontal: cw(14)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cw(20)),
            color: AppColor.transparent,
            border: Border.all(color: AppColor.c252525)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ch(38),
              width: cw(38),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.c252525),
              ),
              child: Center(
                  child: SvgPicture.asset(
                AssetUtils.dumbleIcon,
                color: AppColor.primary,
              )),
            ),
            SizedBox(
              width: cw(8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: data['title'] ?? '',
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  fontSize: 14,
                ),
                SizedBox(
                  height: ch(4),
                ),
                AppText(
                  txt: data['title'] ?? '',
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.8),
                  fontSize: 12,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: ch(33),
              width: cw(65),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cw(50)),
                  color: AppColor.cFFFFFF),
              child: Center(
                child: AppText(
                  txt: "Altro",
                  color: AppColor.c252525,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      );

    default:
      return const SizedBox.shrink();
  }
}

Widget walkingBox() {
  return Container(
    height: ch(154),
    width: 100.w,
    padding: EdgeInsets.symmetric(horizontal: cw(14), vertical: ch(14)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cw(20)),
        border: Border.all(color: AppColor.c1E1E1E),
        color: AppColor.c171717),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AssetUtils.walkIcon,
              width: cw(20),
            ),
            SizedBox(
              width: cw(7),
            ),
            AppText(
              txt: "•",
              color: AppColor.cFFFFFF,
              fontSize: AppFontSize.f15,
              height: 1.5,
            ),
            SizedBox(
              width: cw(7),
            ),
            AppText(
              txt: "Camminando",
              fontWeight: FontWeight.w500,
              color: AppColor.cFFFFFF,
              fontSize: AppFontSize.f16,
              height: 1.5,
            ),
            const Spacer(),
            Container(
              height: ch(26),
              width: cw(26),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.c252525),
                  color: AppColor.transparent),
              child: Center(child: SvgPicture.asset(AssetUtils.arrowUp)),
            ),
          ],
        ),
        SizedBox(
          height: ch(34),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      txt: "2104",
                      color: AppColor.cFFFFFF,
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: cw(5),
                    ),
                    AppText(
                      txt: "Passi",
                      fontWeight: FontWeight.w200,
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: ch(18),
                ),
                Row(
                  children: [
                    AppText(
                      txt: "1.58",
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: cw(5),
                    ),
                    AppText(
                      txt: "km  ",
                      fontWeight: FontWeight.w200,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      fontSize: 12,
                    ),
                    SizedBox(
                      width: cw(7),
                    ),
                    AppText(
                      txt: "•",
                      color: AppColor.cFFFFFF,
                      fontSize: 12,
                      height: 1.5,
                    ),
                    SizedBox(
                      width: cw(7),
                    ),
                    AppText(
                      txt: "105",
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: cw(4),
                    ),
                    AppText(
                      txt: "kcal  ",
                      fontWeight: FontWeight.w200,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      fontSize: 12,
                    ),
                    SizedBox(
                      width: cw(7),
                    ),
                    AppText(
                      txt: "•",
                      color: AppColor.cFFFFFF,
                      fontSize: 12,
                      height: 1.5,
                    ),
                    SizedBox(
                      width: cw(7),
                    ),
                    AppText(
                      txt: "85",
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: cw(5),
                    ),
                    AppText(
                      txt: "kg",
                      fontWeight: FontWeight.w200,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: ch(56),
              width: cw(56),
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: cw(5),
                percent: 0.5,
                animation: true,
                animationDuration: 1000,
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient: const LinearGradient(
                    colors: [AppColor.primary, AppColor.red]),
                backgroundColor: AppColor.c252525,
                // progressColor: AppColor.primary,
              ),
            ),
          ],
        ),

        // CircularPercentIndicator(
        //   radius: 25.0,
        //   lineWidth: cw(7),
        //   percent: 0.5,
        //   animation: true,
        //   animationDuration: 1000,
        //   circularStrokeCap: CircularStrokeCap.round,
        //   linearGradient: const LinearGradient(
        //       colors: [AppColor.primary, AppColor.red]),
        //   backgroundColor: AppColor.cFFFFFF,
        //   // progressColor: AppColor.primary,
        // ),
      ],
    ),
  );
}

Widget circularGraph() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        txt: "Pasto di oggi",
        fontWeight: FontWeight.w500,
        color: AppColor.cFFFFFF,
        fontSize: 14,
      ),
      SizedBox(
        height: ch(14),
      ),
      Consumer<DashboardHomeScreenController>(
        builder: (context, model, child) {
          final title = model.catType["title"]!;
          // final icons = model.catType["iconImage"]!;
          final calories = model.catType["calories"]!;

          return Wrap(
            alignment: WrapAlignment.center,
            spacing: cw(12),
            runSpacing: 16,
            children: List.generate(title.length, (index) {
              final isSelected = model.selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  // model.setSelectIndex(index)
                },
                child: Container(
                  width: cw(160),
                  height: ch(72),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primary : AppColor.c171717,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: cw(14)),
                    child: Row(
                      children: [
                        SizedBox(
                          height: ch(44),
                          width: cw(44),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: cw(5),
                              percent: () {
                                double val = 0.0;
                                if (model.dailyNutritionData.isNotEmpty) {
                                  String key = "";
                                  if (index == 0) {
                                    key = "calories";
                                  } else if (index == 1) {
                                    key = "protein";
                                  } else if (index == 2) {
                                    key = "carbs";
                                  } else if (index == 3) {
                                    key = "fats";
                                  }

                                  if (key.isNotEmpty &&
                                      model.dailyNutritionData[key] != null) {
                                    val = ((model.dailyNutritionData[key]
                                                ["percentage"] ??
                                            0) /
                                        100.0);
                                  }
                                }
                                return val.clamp(0.0, 1.0);
                              }(),
                              animation: true,
                              progressColor: index == 0
                                  ? AppColor.primary
                                  : index == 1
                                      ? AppColor.green
                                      : index == 2
                                          ? AppColor.yellow
                                          : AppColor.red,
                              animationDuration: 1000,
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: AppColor.c1E1E1E,
                            ),
                          ),
                        ),
                        SizedBox(width: cw(13)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              txt: title[index],
                              fontSize: AppFontSize.f15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                            ),
                            SizedBox(
                              height: ch(4),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: () {
                                      if (model.dailyNutritionData.isEmpty) {
                                        return "0";
                                      }
                                      String key = "";
                                      if (index == 0) {
                                        key = "calories";
                                      } else if (index == 1) {
                                        key = "protein";
                                      } else if (index == 2) {
                                        key = "carbs";
                                      } else if (index == 3) {
                                        key = "fats";
                                      }
                                      if (key.isNotEmpty &&
                                          model.dailyNutritionData[key] !=
                                              null) {
                                        return model.dailyNutritionData[key]
                                                ["goal"]
                                            .toString();
                                      }
                                      return "0";
                                    }(),
                                    style: TextStyle(
                                      fontSize: AppFontSize.f20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.cFFFFFF,
                                    )),
                                TextSpan(
                                    text: index == 0 ? " kcal" : " g",
                                    style: TextStyle(
                                      fontSize: AppFontSize.f15,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.cFFFFFF.withOpacity(0.7),
                                    )),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    ],
  );
}

Widget nextMeal() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            txt: "Prossimo pasto",
            fontWeight: FontWeight.w400,
            color: AppColor.cFFFFFF,
            fontSize: 14,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                AppText(
                  txt: "Vedi tutto",
                  fontWeight: FontWeight.w400,
                  color: AppColor.c42A8FF,
                  fontSize: 14,
                ),
                SizedBox(
                  width: cw(8),
                ),
                SvgPicture.asset(AssetUtils.keyboardArrow)
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: ch(12),
      ),
      Consumer<DashboardHomeScreenController>(
        builder: (context, model, child) {
          final items = model.nextMealList;
          return ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.w,
                  height: ch(66),
                  padding:
                      EdgeInsets.symmetric(horizontal: cw(6), vertical: ch(6)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.c171717),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(cw(15)),
                        child: Image.network(
                          items[index]["img"],
                          height: ch(54),
                          width: cw(54),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: cw(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: items[index]["title"],
                            fontWeight: FontWeight.w500,
                            color: AppColor.cFFFFFF,
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: ch(4),
                          ),
                          AppText(
                            txt: items[index]["subTitle"],
                            fontWeight: FontWeight.w400,
                            color: AppColor.cFFFFFF.withOpacity(0.5),
                            fontSize: 10,
                          ),
                          SizedBox(
                            height: ch(5),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: "Pr",
                                style: TextStyle(
                                    color: AppColor.c34C759,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: " • ${items[index]["prG"]}  ",
                                style: const TextStyle(
                                    color: AppColor.cFFFFFF,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                            const TextSpan(
                                text: "Crb",
                                style: TextStyle(
                                    color: AppColor.cFFCC00,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: " • ${items[index]["crbG"]}  ",
                                style: const TextStyle(
                                    color: AppColor.cFFFFFF,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                            const TextSpan(
                                text: "Fats",
                                style: TextStyle(
                                    color: AppColor.cFF383C,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: " • ${items[index]["fatsG"]}  ",
                                style: const TextStyle(
                                    color: AppColor.cFFFFFF,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                          ]))
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(AssetUtils.exploreIcon),
                      SizedBox(
                        width: cw(10),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: ch(12),
                );
              },
              itemCount: model.cardData.length);
        },
      )
    ],
  );
}
