import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/date_of_birth/date_of_birth_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateOfBirthView extends StatelessWidget {
  const DateOfBirthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          onboaridngAppBar(
              context: context, activeSegments: 2, totalSegments: 6),
          SizedBox(
            height: ch(114),
          ),
          Padding(
              padding: EdgeInsets.only(top: ch(114)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cw(25)),
                        topRight: Radius.circular(cw(25)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ch(20),
                    ),
                    AppText(
                      txt: "Quand'è il tuo compleanno?",
                      fontSize: AppFontSize.f20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.cFFFFFF,
                      height: 1,
                    ),
                    SizedBox(
                      height: ch(12),
                    ),
                    AppText(
                      txt:
                          "QQuesto ci aiuta a personalizzare il tuo primo piano di\nallenamento e nutrizione.",
                      fontSize: AppFontSize.f18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.cFFFFFF.withOpacity(0.5),
                      height: 1.5,
                    ),
                    SizedBox(
                      height: ch(114),
                    ),
                    SizedBox(
                      height: ch(240),
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: ch(45),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          // A Row to hold the three scroll wheels
                          Consumer<DateOfBirthController>(
                              builder: (context, dobProvider, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // --- DAY PICKER ---
                                SizedBox(
                                  width: cw(70),
                                  child: ListWheelScrollView.useDelegate(
                                    physics: const FixedExtentScrollPhysics(),
                                    itemExtent: ch(40),
                                    perspective: 0.008,
                                    diameterRatio: 2.5,
                                    onSelectedItemChanged: (index) {
                                      dobProvider.setSelectedDay(index);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: dobProvider.days.length,
                                      builder: (context, index) => Center(
                                        child: AppText(
                                          txt:dobProvider.days[index],
                                          
                                              fontSize: AppFontSize.f16,
                                              color: AppColor.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // --- MONTH PICKER (Italian) ---
                                SizedBox(
                                  width: cw(120),
                                  child: ListWheelScrollView.useDelegate(
                                    physics: const FixedExtentScrollPhysics(),
                                    itemExtent: ch(40),
                                    perspective: 0.008,
                                    diameterRatio: 2.5,
                                    onSelectedItemChanged: (index) {
                                      dobProvider.setSelectedMonth(index);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: dobProvider.months.length,
                                      builder: (context, index) => Center(
                                        child:AppText(
                                          // Assuming AppText is similar to Text
                                          txt:dobProvider.months[index],
                                          
                                              fontSize: AppFontSize.f16,
                                              color: AppColor.white),
                                        
                                      ),
                                    ),
                                  ),
                                ),

                                // --- YEAR PICKER ---
                                SizedBox(
                                  width: cw(80),
                                  child: ListWheelScrollView.useDelegate(
                                    physics: const FixedExtentScrollPhysics(),
                                    itemExtent: ch(40),
                                    perspective: 0.008,
                                    diameterRatio: 2.5,
                                    onSelectedItemChanged: (index) {
                                      dobProvider.setSelectedYear(index);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: dobProvider.years.length,
                                      builder: (context, index) => Center(
                                        child: AppText(txt:
                                          // Assuming AppText is similar to Text
                                          dobProvider.years[index],
                                         
                                             
                                              fontSize: AppFontSize.f16,
                                              color: AppColor.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                    const Spacer(),
              AppButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, RoutePaths.selectGender, (route) => false);
              },text: "Avanti",),
              SizedBox(height: ch(40),)
                  ],
                ),
              )),
              
        ],
      ),
    );
  }
}
