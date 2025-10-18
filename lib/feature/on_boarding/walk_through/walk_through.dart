import 'package:ast_official/app_ui_helpers/app_router/app_router.dart';
import 'package:ast_official/feature/on_boarding/select_plan/select_plan.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Benvenuti in\nMetodo AST.",
      "subtitle":
          "Allenamento e nutrizione personalizzati\nbasati sul Metodo A.S.T.®.",
      "image":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQWWk0c4HHqv3k4058hngIFoOMp9X8urC3L9YBvygP1gA8F838o",
    },
    {
      "title": "Allenatore che\nanalizza i progressi.",
      "subtitle":
          "Gestisci gli atleti, approva i piani, monitora\nle royalties e fai crescere il tuo coaching.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLlF75L9aNEgkI-wcBV-5H4r1IZHALpuAzD02H5j-n60Pfmvf-A9HsIUWOYZdwGX_62gU&usqp=CAU",
    },
    {
      "title": "Interfaccia della\nclasse online",
      "subtitle":
          "Fornisci certificazioni, gestisci corsi e fai\ncrescere la rete A.S.T.®.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPoWPK1gabfYBM-9ea-q4PyabGe4ZF1cbjn6yfhmX3CaqfsfsPNbFP_3M9bK1sDg4nZTs&usqp=CAU",
    },
    {
      "title": "Allenatore che\nanalizza i progressi.",
      "subtitle":
          "Gestisci gli atleti, approva i piani, monitora\nle royalties e fai crescere il tuo coaching.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLlF75L9aNEgkI-wcBV-5H4r1IZHALpuAzD02H5j-n60Pfmvf-A9HsIUWOYZdwGX_62gU&usqp=CAU",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) => onBaordContentct(
                          title: onboardingData[index]["title"]!,
                          subtitle: onboardingData[index]["subtitle"]!,
                          image: onboardingData[index]["image"]!,
                          primaryTextColor: index == 0
                              ? AppColor.grey.withOpacity(0.6)
                              : AppColor.yellow,
                          secondoryTextColor: index == 0
                              ? AppColor.yellow
                              : AppColor.green.withOpacity(0.6),
                        )),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: ch(30),
            child: Row(
              children: [
                AppButton(
                  height: ch(66),
                  width: cw(66),
                  borderRadius: cw(24.91),
                  buttonColor: AppColor.cFFFFFF.withOpacity(0.5),
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  },
                  child: Center(
                    child: AppText(
                      txt: "Salta",
                      color: AppColor.cFFFFFF,
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(24)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      onboardingData.length,
                      (index) => buildDot(currentPage, index),
                    ),
                  ),
                ),
                const Spacer(),
                AppButton(
                  height: ch(66),
                  width: cw(66),
                  borderRadius: cw(24.91),
                  buttonColor: AppColor.cFFFFFF,
                  onPressed: () {
                    if (currentPage == onboardingData.length - 1) {
                      goToReplace(context, const SelectPlan());
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                      );
                    }
                  },
                  showIcon: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AnimatedContainer buildDot(int currentPage, int index) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    // margin: EdgeInsets.only(right: cw(6)),
    height: ch(15),
    width: cw(15),
    decoration: BoxDecoration(
      border: Border.all(
          color: index == currentPage
              ? AppColor.cFFFFFF.withOpacity(0.5)
              : AppColor.transparent,
          width: 2),
      shape: BoxShape.circle,
      // color: index <= currentPage
      //     ? AppColor.cFFFFFF.withOpacity(0.5)
      //     : AppColor.transparent,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: ch(6),
          width: cw(6),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColor.white),
        ),
      ],
    ),
  );
}

Widget onBaordContentct({
  required String title,
  required String subtitle,
  required String image,
  required Color primaryTextColor,
  required Color secondoryTextColor,
}) {
  return Container(
    height: 100.h,
    width: 100.h,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: cw(20)),
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
              Container(
                height: ch(30),
                padding: EdgeInsets.symmetric(horizontal: cw(10)),
                decoration: BoxDecoration(
                    color: AppColor.c252525.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: AppText(
                    txt: "Registrazione",
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          AppText(
            txt: title,
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: AppColor.cFFFFFF,
            height: 1.5,
          ),
          AppText(
            txt: subtitle,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.cFFFFFF.withOpacity(0.8),
            height: 1.5,
          ),
          SizedBox(
            height: ch(150),
          )
        ],
      ),
    ),
  );
}
