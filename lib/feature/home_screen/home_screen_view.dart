import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreenview extends StatefulWidget {
  const HomeScreenview({super.key});

  @override
  State<HomeScreenview> createState() => _HomeScreenviewState();
}

class _HomeScreenviewState extends State<HomeScreenview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ch(86)), child: _appBar()),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AssetUtils.cloudIcon),
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
                  txt: " 90°C pioggia leggera oggi.",
                  fontWeight: FontWeight.w200,
                  color: AppColor.cFFFFFF,
                  fontSize: 12,
                  height: 1.5,
                ),
              ],
            ),
            SizedBox(
              height: ch(21),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context,
                    RoutePaths.personalizeYourExperienceView, (route) => false);
              },
              child: Container(
                height: ch(63),
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cw(20)),
                    border: Border.all(color: AppColor.c252525),
                    color: AppColor.transparent),
                child: Center(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: "Personalizza la tua esperienza",
                            color: AppColor.cFFFFFF,
                            fontSize: 14,
                            height: 1.5,
                          ),
                          AppText(
                            txt: "Iniziamo il processo",
                            fontWeight: FontWeight.w200,
                            color: AppColor.cFFFFFF.withOpacity(0.7),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: ch(33),
                        width: cw(71),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cw(20)),
                            border: Border.all(color: AppColor.c252525),
                            color: AppColor.white),
                        child: Center(
                          child: AppText(
                            txt: "Inizia",
                            color: AppColor.c121212,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ch(30),
            ),
            Container(
              height: ch(154),
              width: 100.w,
              padding:
                  EdgeInsets.symmetric(horizontal: cw(14), vertical: ch(14)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cw(20)),
                  border: Border.all(color: AppColor.c252525),
                  color: AppColor.c252525.withOpacity(0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AssetUtils.cloudIcon),
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
                        txt: "Camminando",
                        fontWeight: FontWeight.w200,
                        color: AppColor.cFFFFFF,
                        fontSize: 12,
                        height: 1.5,
                      ),
                      const Spacer(),
                      Container(
                        height: ch(33),
                        width: cw(71),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cw(20)),
                            border: Border.all(color: AppColor.c252525),
                            color: AppColor.transparent),
                        child: Center(
                          child: AppText(
                            txt: "Inizia",
                            color: AppColor.cFFFFFF,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
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
                                txt: "0",
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
                                txt: "0",
                                color: AppColor.cFFFFFF.withOpacity(0.7),
                                fontSize: 20,
                              ),
                              SizedBox(
                                width: cw(5),
                              ),
                              AppText(
                                txt: "km  ",
                                fontWeight: FontWeight.w200,
                                color: AppColor.cFFFFFF.withOpacity(0.7),
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
                                txt: "0",
                                color: AppColor.cFFFFFF.withOpacity(0.7),
                                fontSize: 20,
                              ),
                              SizedBox(
                                width: cw(4),
                              ),
                              AppText(
                                txt: "kcal  ",
                                fontWeight: FontWeight.w200,
                                color: AppColor.cFFFFFF.withOpacity(0.7),
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
                                txt: "0",
                                color: AppColor.cFFFFFF.withOpacity(0.7),
                                fontSize: 20,
                              ),
                              SizedBox(
                                width: cw(5),
                              ),
                              AppText(
                                txt: "kg",
                                fontWeight: FontWeight.w200,
                                color: AppColor.cFFFFFF.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CircularProgressIndicator(
                        color: AppColor.primary,
                        backgroundColor: AppColor.c252525,
                        // progressColor: AppColor.primary,))
                      )
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
            ),
          ],
        ),
      )),
    );
  }
}

Widget _appBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(
          height: ch(40),
        ),
        Row(
          children: [
            Container(
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
                  fontSize: 12,
                  height: 1.5,
                ),
                AppText(
                  txt: "Kelvin Dane",
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                  fontSize: 18,
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
