import 'package:ast_official/app_ui_helpers/app_router/app_router.dart';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/on_boarding/sign_in/sign_in_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectRoleView extends StatefulWidget {
  const SelectRoleView({super.key});

  @override
  State<SelectRoleView> createState() => _SelectRoleViewState();
}

class _SelectRoleViewState extends State<SelectRoleView> {
  // final Map<String, dynamic> selectType = {
  //   "title": ["ASASAS", "aSAS", "aEWEWD"],
  //   "subtitle": ["Asa", "ada", "ewewee"],
  // };
  int? currentIndex;
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
              fontSize: AppFontSize.f22,
              fontWeight: FontWeight.w500,
              color: AppColor.cFFFFFF,
              height: 1.5,
            ),
            AppText(
              txt:
                  "Seleziona l’opzione che ti descrive meglio. Questo\npersonalizzerà la tua esperienza.",
              fontSize: AppFontSize.f16,
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
                      height: ch(100),
                      padding: EdgeInsets.symmetric(
                        horizontal: cw(16),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(selectTypeList[index].image),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(cw(12)),
                        border: Border.all(
                            color: currentIndex == index
                                ? (index == 0
                                    ? AppColor.red
                                    : index == 1
                                        ? AppColor.cFFB236
                                        : index == 2
                                            ? AppColor.c336255
                                            : AppColor.transparent)
                                : AppColor.transparent,
                            width: 2),
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
                                fontSize: AppFontSize.f19,
                                fontWeight: FontWeight.w800,
                                color: AppColor.cFFFFFF,
                                height: 1.5,
                              ),
                              SizedBox(
                                width: cw(172),
                                child: AppText(
                                  txt: selectTypeList[index].subtitle,
                                  fontSize: AppFontSize.f15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.cFFFFFF.withOpacity(0.8),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
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
            if (currentIndex != null) ...[
              AppButton(
                buttonColor: AppColor.cFFFFFF,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutePaths.signIn, (route) => false);
                  //  goTo(context, const SignIn());
                  // log(currentIndex.toString());
                },
                child: AppText(
                  txt: "Continuare",
                  color: AppColor.black,
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: ch(40),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SelectType {
  final String title;
  final String subtitle;
  final String image;

  SelectType({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

final List<SelectType> selectTypeList = [
  SelectType(
      title: "Atleta",
      subtitle: "Ottieni piani di allenamento e nutrizione su misura per te.",
      image: AssetUtils.selectedRoleAthlete),
  SelectType(
      title: "Allenatore",
      subtitle: "Gestisci gli atleti e sviluppa la tua carriera da coach.",
      image: AssetUtils.selectedRoleCoach),
  SelectType(
      title: "Tutor",
      subtitle: "Eroga corsi e certifica nuovi coach.",
      image: AssetUtils.selectedRoleTutor),
];
