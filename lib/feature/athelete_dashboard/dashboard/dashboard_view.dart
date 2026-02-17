import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/check_in_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/check_in_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/dashboard_home_screen/dashboard_home_screen_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/training_controller.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/training_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DashboardView extends StatefulWidget {
  Widget? firstPage;
  DashboardView({
    super.key,
    this.firstPage,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;
  late List<Widget> screenList; // ✅ Declare here

  // final List<Widget> screenList = [
  //   widget.firstPage ?? const DashboardHomeScreen(),
  //   // const HomeScreenview(),
  //   const TrainingView(),
  //   const AtheletCoachesView(),
  //   const CheckIn(),
  //   const AtheletChatView()
  // ];

  @override
  void initState() {
    super.initState();
    screenList = [
      ChangeNotifierProvider(
        create: (context) => DashboardHomeScreenController(
          appRepoService: context.read<AppRepoService>(),
        ),
        child: widget.firstPage ?? const DashboardHomeScreen(),
      ),
      ChangeNotifierProvider(
        create: (context) => TrainingViewController(
          appRepoService: context.read<AppRepoService>(),
        ),
        child: const TrainingView(),
      ),
      ChangeNotifierProvider(
        create: (context) => AtheletCoachesController(
          appRepoService: context.read<AppRepoService>(),
        ),
        child: const AtheletCoachesView(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckInController(
          appRepoService: context.read<AppRepoService>(),
        ),
        child: const CheckIn(),
      ),
      ChangeNotifierProvider(
        create: (context) => AtheletChatController(),
        child: const AtheletChatView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: _bottomNavBar(),
        body: Consumer<DashboardController>(
      builder: (context, model, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                controller: model.pageController,
                onPageChanged: model.setSelectedIndex,
                children: screenList,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: ch(10),
              child: _bottomNavBar(),
            ),
          ],
        );
      },
    ));
  }
}

Widget homeScreen() {
  return Container(
    height: 98,
    width: 200,
    color: AppColor.blue,
  );
}

Widget _bottomNavBar() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
    child: Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.c252525.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
              offset: const Offset(30, 16), color: AppColor.c000000.withOpacity(0.15))
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Consumer<DashboardController>(
        builder: (context, model, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(model.iconsList.length, (index) {
              final bool isSelected = model.selectedIndex == index;

              return InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  model.setSelectedIndex(index);

                  model.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? Colors.red.withOpacity(0.9)
                        : AppColor.c1E1E1E,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      model.iconsList[index],
                      // colorFilter: ColorFilter.mode(
                      //   isSelected ? AppColor.cFFFFFF : AppColor.cFFFFFF,
                      //   BlendMode.srcIn,
                      // ),
                      height: ch(24),
                      width: cw(24),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    ),
  );
}
