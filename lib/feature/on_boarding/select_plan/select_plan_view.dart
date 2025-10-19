import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({super.key});

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  // final Map<String, dynamic> selectType = {
  //   "title": ["ASASAS", "aSAS", "aEWEWD"],
  //   "subtitle": ["Asa", "ada", "ewewee"],
  // };
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ch(45),
            ),
            Row(
              children: [
                SvgPicture.asset(AssetUtils.walkthroughIcon),
                const Spacer(),
                const Icon(
                  Icons.close,
                  color: AppColor.cFFFFFF,
                  size: 20,
                )
              ],
            ),
            SizedBox(
              height: ch(30),
            ),
            AppText(
              txt: "Dicci chi sei per continuare.",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColor.cFFFFFF,
              height: 1.5,
            ),
            AppText(
              txt:
                  "Seleziona l’opzione che ti descrive meglio. Questo\npersonalizzerà la tua esperienza.",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.cFFFFFF.withOpacity(0.8),
              height: 1.5,
            ),
            SizedBox(
              height: ch(42),
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      height: ch(80),
                      padding: EdgeInsets.symmetric(
                        horizontal: cw(16),
                      ),
                      decoration: BoxDecoration(
                        color: selectTypeList[index].color,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: currentIndex == index
                                ? AppColor.yellow
                                : AppColor.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: selectTypeList[index].title,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColor.cFFFFFF,
                                height: 1.5,
                              ),
                              AppText(
                                txt: selectTypeList[index].subtitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.cFFFFFF.withOpacity(0.8),
                                height: 1.5,
                              ),
                            ],
                          ),
                          const Spacer(),
                          SvgPicture.asset(AssetUtils.walkthroughIcon),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: ch(20),
                  );
                },
                itemCount: selectTypeList.length),
            const Spacer(),
            AppButton(
              buttonColor: AppColor.cFFFFFF,
              onPressed: () {},
              child: AppText(
                txt: "Continuare",
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: ch(30),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectType {
  final String title;
  final String subtitle;
  final Color color;

  SelectType({
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

final List<SelectType> selectTypeList = [
  SelectType(title: "ASASAS", subtitle: "Asa", color: AppColor.primary),
  SelectType(title: "aSAS", subtitle: "ada", color: AppColor.black),
  SelectType(title: "aEWEWD", subtitle: "ewewee", color: AppColor.brown),
];
