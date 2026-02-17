import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_view.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/check_in_reviews/check_in_reviews_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/coach_chat_view.dart';
import 'package:ast_official/feature/coach_dashboard/coach_main_screen_controller.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans/plans_management/plans_management_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar.dart';
import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CoachMainScreen extends StatelessWidget {
  const CoachMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CoachBottomBar>(context);
    final controller =
        Provider.of<CoachMainScreenController>(context, listen: false);
    // model.setContext(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (model.coachesList.isEmpty && !model.isLoading) {
      //   model.getAllMyAtheletes(context: context);
      // }
      // controller.getAtheletPendingRequest(context: context);
      controller.startPendingRequestsTimer(context);

      // Future.delayed(const Duration(), () {
      //   controller.getAtheletPendingRequest(context: context);
      // });
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ch(60)),
        child: _appBar(context: context, model: model),
      ),
      bottomNavigationBar: coachBottomBar(),
      body: PageView(
        onPageChanged: (index) => model.setSelectedIndex(index),
        controller: model.pageController,
        children: const [
          CoachHomeScreenView(),
          AthleteManagementView(),
          PlansManagementView(),
          CheckInReviewsView(),
          CoachChatView()
        ],
      ),
    );
  }
}

Widget _appBar({
  required BuildContext context,
  required model,
  Function? onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: ch(20)),
        Row(
          children: [
            AppText(
              txt: model.selectedIndex == 0
                  ? "Pannello Di Controllo"
                  : model.selectedIndex == 1
                      ? "Atlete"
                      : model.selectedIndex == 2
                          ? "Plans"
                          : model.selectedIndex == 3
                              ? "Recensioni del check-in"
                              : "Chats",
              fontSize: AppFontSize.f22,
              isItalic: true,
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (model.selectedIndex == 4)
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetUtils.addIcon,
                  height: ch(30),
                ),
              )
            else ...[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.notificationScreen);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: ch(39),
                      width: cw(39),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.c252525)),
                      child: Center(
                        child: Container(
                          height: ch(34),
                          width: cw(34),
                          decoration: const BoxDecoration(
                            color: AppColor.c252525,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            gradient: AppGradients.redGradient),
                        // constraints: const BoxConstraints(
                        //   minWidth: 16,
                        //   minHeight: 16,
                        // ),
                        child: const Center(
                          child: Text(
                            '14',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: cw(20),
              ),
              GestureDetector(
                onTap: () =>
                    onTap ??
                    Navigator.pushNamed(
                        context, RoutePaths.coachProfileSettingScreen),
                child: SvgPicture.asset(
                  AssetUtils.profileIcon,
                  height: ch(40),
                ),
              )
            ],
          ],
        ),
      ],
    ),
  );
}
