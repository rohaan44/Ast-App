import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/coach_profile/coach_profile_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
// import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/shimmer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CoachProfileView extends StatelessWidget {
  const CoachProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring controller exists in context is handled by parent provider
    final controller = context.watch<CoachProfileController>();

    return SafeArea(
      child: Scaffold(
        body: GlobalSkeleton(
          isLoading: controller.isLoading,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: ch(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, controller),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ch(24)),
                      _buildActionButtons(
                          onSendRequest: () {}, onMessage: () {}),
                      SizedBox(height: ch(24)),
                      _buildAboutSection(controller),
                      SizedBox(height: ch(24)),
                      _buildWorkoutsSection(controller),
                      SizedBox(height: ch(24)),
                      _buildReviewsSection(controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CoachProfileController controller) {
    return Column(
      children: [
        // App Bar Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(10), vertical: ch(10)),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const Spacer(),
            ],
          ),
        ),
        // Profile Image
        Container(
          height: cw(100),
          width: cw(100),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.c252525, width: 2),
            image: DecorationImage(
              image: NetworkImage(controller.coachData['image'] ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: ch(12)),
        // Name
        AppText(
          txt: controller.coachData['name'] ?? "Name",
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
        SizedBox(height: ch(8)),
        // Specialties
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...(controller.coachData['specialties'] as List)
                .asMap()
                .entries
                .map((entry) {
              final Map item = entry.value;
              final index = entry.key;
              return Row(
                children: [
                  // SvgPicture.asset(AssetUtils.heartIcon, height: 16, width: 16, color: AppColor.red), // Placeholder icon
                  // Using dynamic icon logic or placeholders
                  Icon(
                    item['label'] == "Cardio"
                        ? Icons.favorite
                        : item['label'] == "Anaerobico"
                            ? Icons.bolt
                            : Icons.balance,
                    color: item['label'] == "Cardio"
                        ? AppColor.red
                        : item['label'] == "Anaerobico"
                            ? Colors.amber
                            : Colors.cyan,
                    size: 16,
                  ),
                  SizedBox(width: cw(4)),
                  AppText(
                      txt: item['label'],
                      fontSize: AppFontSize.f16,
                      color: AppColor.white.withOpacity(0.8)),
                  if (index !=
                      (controller.coachData['specialties'] as List).length - 1)
                    Container(
                        height: 12,
                        width: 1,
                        color: Colors.white24,
                        margin: EdgeInsets.symmetric(horizontal: cw(8))),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(
      {VoidCallback? onSendRequest, VoidCallback? onMessage}) {
    return Row(
      children: [
        Expanded(
            child: AppButton(
          height: ch(40),
          // isBorder: true,
          // borderColor: AppColor.c1E1E1E,
          // showIcon: true,
          // icon: const Icon(Icons.email_outlined, color: Colors.white, size: 20),
          textColor: AppColor.white,
          buttonColor: AppColor.red,
          onPressed: onSendRequest ?? () {},
          text: "Send Request",
        )),
        SizedBox(width: cw(12)),
        Expanded(
            child: AppButton(
          height: ch(40),
          isBorder: true,
          borderColor: AppColor.c252525,
          showIcon: true,
          icon: const Icon(Icons.email_outlined, color: Colors.white, size: 20),
          textColor: AppColor.white,
          buttonColor: AppColor.c171717,
          onPressed: onMessage ?? () {},
          text: "Message",
        )),
        SizedBox(width: cw(12)),
        Container(
          width: cw(40),
          height: ch(40),
          decoration: BoxDecoration(
            color: AppColor.c171717,
            border: Border.all(color: AppColor.c252525),
            borderRadius: BorderRadius.circular(cw(24)),
          ),
          child:
              const Icon(Icons.share_outlined, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  Widget _buildAboutSection(CoachProfileController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => controller.toggleAboutExpanded(),
          child: Row(
            children: [
              AppText(
                txt: "Informazioni sul coach",
                fontSize: AppFontSize.f19,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
              Icon(
                  controller.isAboutExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.chevron_right,
                  color: Colors.white70),
            ],
          ),
        ),
        SizedBox(height: ch(8)),
        GestureDetector(
          onTap: () {
            controller.toggleAboutExpanded();
          },
          child: Consumer<CoachProfileController>(
              builder: (context, controller, child) {
            return AppText(
              txt: controller.coachData['about'] ?? "",
              fontSize: AppFontSize.f15,
              fontWeight: FontWeight.w400,
              color: AppColor.white.withOpacity(0.7),
              maxLines: controller.isAboutExpanded ? 100 : 4,
              overflow: TextOverflow.ellipsis,
              height: 1.5,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildWorkoutsSection(CoachProfileController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Allenamenti",
              fontSize: AppFontSize.f18,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
            AppText(
              txt: "Vedi tutti >",
              fontSize: AppFontSize.f16,
              color: AppColor.primary, // Using primary/blue color
            ),
          ],
        ),
        SizedBox(height: ch(12)),
        // Single Horizontal List (or just one card as per image reference)
        ...controller.workouts
            .map((workout) => _buildWorkoutCard(workout))
            .toList(),
      ],
    );
  }

  Widget _buildWorkoutCard(Map<String, dynamic> workout) {
    return Container(
      height: ch(180),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cw(16)),
        image: DecorationImage(
          image: NetworkImage(workout['image']),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      padding: EdgeInsets.all(cw(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildBadge(workout['badges'][0], Icons.timer_outlined),
              SizedBox(width: cw(8)),
              _buildBadge(
                  workout['badges'][1], Icons.local_fire_department_outlined),
            ],
          ),
          const Spacer(),
          AppText(
            txt: workout['title'],
            fontSize: AppFontSize.f20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          AppText(
            txt: workout['subtitle'],
            fontSize: AppFontSize.f15,
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: ch(8)),
          Row(
            children: [
              _buildTag(workout['tags'][0], dark: true),
              SizedBox(width: cw(8)),
              _buildTag(workout['tags'][1], dark: true),
              const Spacer(),
              const CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.play_arrow, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBadge(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: cw(8), vertical: ch(4)),
      decoration: BoxDecoration(
        color: Colors.black45, // Translucent black
        borderRadius: BorderRadius.circular(cw(12)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 12),
          SizedBox(width: cw(4)),
          AppText(txt: text, fontSize: AppFontSize.f15, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildTag(String text, {bool dark = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: cw(10), vertical: ch(4)),
      decoration: BoxDecoration(
        color: dark ? Colors.black45 : AppColor.c252525,
        borderRadius: BorderRadius.circular(cw(12)),
      ),
      child:
          AppText(txt: text, fontSize: AppFontSize.f15, color: Colors.white70),
    );
  }

  Widget _buildReviewsSection(CoachProfileController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Recensioni",
              fontSize: AppFontSize.f18,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
            AppText(
              txt: "Di più >",
              fontSize: AppFontSize.f16,
              color: AppColor.primary,
            ),
          ],
        ),
        SizedBox(height: ch(12)),
        Container(
          padding: EdgeInsets.all(cw(16)),
          decoration: BoxDecoration(
            color: AppColor.c252525.withOpacity(0.5),
            borderRadius: BorderRadius.circular(cw(16)),
            border: Border.all(color: AppColor.c252525),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(
                        txt: "${controller.reviewStats['rating']}",
                        fontSize: AppFontSize.f24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      AppText(
                        txt: "/5",
                        fontSize: AppFontSize.f16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: ch(10)),
                  AppText(
                    height: 1.5,
                    txt:
                        "Oltre ${controller.reviewStats['totalRatings']} valutazioni",
                    fontSize: AppFontSize.f15 - 2,
                    color: Colors.white70,
                  ),
                  AppText(
                    txt:
                        "Oltre ${controller.reviewStats['totalReviews']} recensioni",
                    fontSize: AppFontSize.f15 - 2,
                    height: 1.5,
                    color: Colors.white70,
                  ),
                  SizedBox(height: ch(12)),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(
                            index < 4
                                ? Icons.star
                                : Icons.star_half, // Approximating 4.5
                            color: Colors.amber,
                            size: 16)),
                  )
                ],
              ),
              SizedBox(width: cw(20)),
              Expanded(
                child: Column(
                  children:
                      (controller.reviewStats['distribution'] as List<double>)
                          .asMap()
                          .entries
                          .map((entry) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: ch(4)),
                      child: Row(
                        children: [
                          AppText(
                              txt: "${5 - entry.key}",
                              color: Colors.white70,
                              fontSize: 10),
                          SizedBox(width: cw(8)),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: entry.value,
                                backgroundColor: Colors.white10,
                                color: Colors.amber,
                                minHeight: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
