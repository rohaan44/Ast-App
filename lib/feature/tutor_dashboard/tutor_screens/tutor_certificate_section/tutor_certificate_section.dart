import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_certificate_section/tutor_certificate_section_controller.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutorCertificateSectionView extends StatefulWidget {
  const TutorCertificateSectionView({super.key});

  @override
  State<TutorCertificateSectionView> createState() =>
      _TutorCertificateSectionViewState();
}

class _TutorCertificateSectionViewState
    extends State<TutorCertificateSectionView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<TutorCertificateSectionController>()
          .fetchCertifications(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCertificateSectionController>(context);

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ch(16)),
                AppText(
                  txt: 'Presentazioni',
                  color: AppColor.cFFFFFF,
                  fontSize: AppFontSize.f24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: ch(16)),
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
                          onTap: () => model.setSelectedTab(index, context),
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
                  child: model.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : model.errorMessage.isNotEmpty
                          ? Center(
                              child: AppText(
                                  txt: model.errorMessage, color: Colors.red))
                          : ListView.builder(
                              itemCount: model.filteredCourses.length,
                              itemBuilder: (context, index) {
                                final course = model.filteredCourses[index];
                                // Status logic: case insensitive check
                                final status = (course['status'] ?? '')
                                    .toString()
                                    .toLowerCase();

                                // Data Mapping
                                final coachName = course['issuedTo'] is Map
                                    ? course['issuedTo']['name']
                                    : 'Unknown Coach';
                                final courseTitle = course['course'] is Map
                                    ? course['course']['title']
                                    : 'Unknown Course';
                                final issueDate = course['issueDate'] != null
                                    ? course['issueDate']
                                        .toString()
                                        .split('T')[0]
                                    : '';

                                Color statusColor;
                                bool showRenewNotification = false;

                                if (status == 'active') {
                                  statusColor = AppColor.c34C759;
                                } else if (status == 'pending') {
                                  statusColor = Colors.orange;
                                  showRenewNotification = true;
                                } else if (status == 'expired') {
                                  statusColor = Colors.red;
                                } else {
                                  statusColor = AppColor.c626262;
                                }

                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<FlowDataProvider>()
                                        .addOrUpdateFlow(
                                          flowTag: tutorCertificationFlow,
                                          data: course,
                                        );
                                    Navigator.pushNamed(
                                      context,
                                      RoutePaths.tutorCertificateSectionS0View,
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(cw(16)),
                                        decoration: BoxDecoration(
                                          color: AppColor.c252525,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: cw(12)),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    txt: coachName.toString(),
                                                    color: AppColor.cFFFFFF,
                                                    fontSize: AppFontSize.f19,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.3,
                                                  ),
                                                  SizedBox(height: ch(4)),
                                                  AppText(
                                                    txt: courseTitle.toString(),
                                                    color: AppColor.cFFFFFF
                                                        .withOpacity(0.7),
                                                    fontSize: AppFontSize.f15,
                                                    height: 1.3,
                                                  ),
                                                  SizedBox(height: ch(4)),
                                                  AppText(
                                                    txt: issueDate,
                                                    color: AppColor.cFFFFFF
                                                        .withOpacity(0.7),
                                                    fontSize: AppFontSize.f15,
                                                    height: 1.3,
                                                  ),
                                                  SizedBox(height: ch(6)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: cw(16.5),
                                                  vertical: ch(5)),
                                              decoration: BoxDecoration(
                                                color: statusColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: AppText(
                                                txt: (course['status'] ??
                                                        'Unknown')
                                                    .toString()
                                                    .toUpperCase(),
                                                color: Colors.white,
                                                fontSize: AppFontSize.f18,
                                              ),
                                            ),
                                            const Icon(Icons.chevron_right,
                                                color: Colors.grey, size: 28),
                                          ],
                                        ),
                                      ),
                                      if (showRenewNotification)
                                        Container(
                                          margin: EdgeInsets.only(top: ch(8)),
                                          padding: EdgeInsets.all(cw(8)),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Colors.orange),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.orange,
                                                  size: 20),
                                              SizedBox(width: cw(8)),
                                              Expanded(
                                                child: AppText(
                                                  txt:
                                                      "Certificate pending renewal. Fees paid.",
                                                  color: Colors.orange,
                                                  fontSize: AppFontSize.f14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      SizedBox(height: ch(12)),
                                    ],
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
