import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_courses_section/sub_screens/tutor_course_section_s1/tutor_course_section_s1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_view.dart';

// class TutorMainScreen extends StatelessWidget {
//   const TutorMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TutorBottomBar(),
//       child: const _TutorMainBody(),
//     );
//   }
// }

class TutorMainScreen extends StatelessWidget {
  const TutorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorBottomBar>(context);

    return Scaffold(
       body: PageView(
        controller: model.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => model.setSelectedIndex(index),
        children: const [
          // index 0
          TutorHomeScreenView(),
          // index 1
          // TutorCoachScreenView(),
          // index 2
          // TutorLessonsScreenView(),
          // index 3
          // TutorMessagesScreenView(),
          // index 4
          TutorCourseSectionS1View(),
        ],
      ),
      bottomNavigationBar: tutorBottomBar(),
    );
  }
}
