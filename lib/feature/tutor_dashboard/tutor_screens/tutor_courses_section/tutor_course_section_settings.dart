import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_courses_section/tutor_course_section_settings_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorCourseSection extends StatefulWidget {
  const TutorCourseSection({super.key});

  @override
  State<TutorCourseSection> createState() => _TutorCourseSectionState();
}

class _TutorCourseSectionState extends State<TutorCourseSection> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCourseSectionController>(context);

    return Scaffold(
      backgroundColor: AppColor.c000000,
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
                  Container(
                    height: ch(46),
                    decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: cw(12)),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 20),
                        SizedBox(width: 8),
                        Expanded(
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.filterTabs.length,
                      itemBuilder: (context, index) {
                        final isSelected = model.selectedTab == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => model.setSelectedTab(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(12), vertical: ch(8)),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.red
                                    : AppColor.c252525,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: AppText(
                                  txt: model.filterTabs[index],
                                  color: isSelected
                                      ? AppColor.cFFFFFF
                                      : Colors.grey,
                                  fontSize: AppFontSize.f16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = model.filteredCourses[index];
                        final isActive = course['status'] == 'Attivo';
                        return Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: course['title'],
                                      color: AppColor.cFFFFFF,
                                      fontSize: AppFontSize.f16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 4),
                                    AppText(
                                      txt:
                                          "${course['modules']} Moduli | ${course['students']} Studenti",
                                      color: Colors.grey,
                                      fontSize: AppFontSize.f12,
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: cw(16.5),
                                          vertical: ch(5)),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? AppColor.c34C759
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: AppText(
                                        txt: course['status'],
                                        color: Colors.white,
                                        fontSize: AppFontSize.f16,
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
                  width: cw(64),
                  height: cw(64),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.cFFFFFF),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.black, size: 44),
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
    );
  }
}
