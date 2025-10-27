import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_courses_section/tutor_course_section_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorCourseSectionView extends StatelessWidget {
  const TutorCourseSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCourseSectionController>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ch(16)),
                    AppText(
                      txt: 'Corsi',
                      color: AppColor.cFFFFFF,
                      fontSize: AppFontSize.f24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: ch(16)),

                    // primaryTextField(
                    //     hintText: "Cerca Corsi...",
                    //     prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                    //     controller: model.searchController,
                    //     onChanged: (value) {},
                    //     border: InputBorder.none,
                    //     borderRadius: cw(50)),
                    Container(
                      height: ch(46),
                      decoration: BoxDecoration(
                        color: AppColor.c252525,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: cw(12)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetUtils.searchIcon),
                          SizedBox(width: cw(8)),
                          const Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Cerca Corsi...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ch(20)),
                    SizedBox(
                      height: ch(30),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.filterTabs.length,
                        itemBuilder: (context, index) {
                          final isSelected = model.selectedTab == index;
                          return Padding(
                            padding: EdgeInsets.only(right: cw(8)),
                            child: GestureDetector(
                              onTap: () => model.setSelectedTab(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(
                                    horizontal: cw(12), vertical: ch(8)),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.primary
                                      : AppColor.c252525,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: AppText(
                                    txt: model.filterTabs[index],
                                    color: isSelected
                                        ? AppColor.cFFFFFF
                                        : AppColor.cFFFFFF,
                                    fontSize: AppFontSize.f16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: ch(20)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = model.filteredCourses[index];
                          final isActive = course['status'] == 'Attivo';
                          return Container(
                            // height: ch(100),
                            margin: EdgeInsets.only(bottom: ch(12)),
                            padding: EdgeInsets.all(cw(16)),
                            decoration: BoxDecoration(
                              color: AppColor.c252525,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: cw(66),
                                  height: ch(44),
                                  decoration: BoxDecoration(
                                    color: AppColor.c626262,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      txt: "Corso",
                                      color: AppColor.cFFFFFF,
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ),
                                ),
                                SizedBox(width: cw(12)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: course['title'],
                                        color: AppColor.cFFFFFF,
                                        fontSize: AppFontSize.f18,
                                        fontWeight: FontWeight.bold,
                                        height: 1.3,
                                      ),
                                      SizedBox(height: ch(4)),
                                      AppText(
                                        txt:
                                            "${course['modules']} Moduli | ${course['students']} Studenti",
                                        color: Colors.grey,
                                        fontSize: AppFontSize.f16,
                                      ),
                                      SizedBox(height: ch(6)),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: cw(16.5),
                                            vertical: ch(5)),
                                        decoration: BoxDecoration(
                                          color: isActive
                                              ? AppColor.c34C759
                                              : AppColor.c626262,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: AppText(
                                          txt: course['status'],
                                          color: Colors.white,
                                          fontSize: AppFontSize.f18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right,
                                    color: Colors.grey, size: 28),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: ch(24),
                left: cw(285),
                right: 0,
                child: Center(
                  child: Container(
                    width: cw(60),
                    height: cw(60),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.cFFFFFF),
                    child: IconButton(
                      icon:
                          const Icon(Icons.add, color: Colors.black, size: 44),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutePaths.tutorCourseSectionS1View,
                            (route) => false);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
