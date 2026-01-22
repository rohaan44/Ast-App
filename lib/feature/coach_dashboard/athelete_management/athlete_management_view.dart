import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/ui_molecules/listtile/athlete_listtile.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AthleteManagementView extends StatelessWidget {
  const AthleteManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<AthleteManagementController>(context, listen: false);
    final controller = context.read<AthleteManagementController>();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          controller.hasMore &&
          !controller.isLoading) {
        controller.getRollAthelet(context, loadMore: true);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.rollAtheletList.isEmpty && !controller.isLoading) {
        controller.getRollAthelet(context);
      }
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: cw(20)),
              child: RefreshIndicator(
                color: AppColor.black,
                backgroundColor: AppColor.red,
                onRefresh: () => controller.getRollAthelet(context),
                child: GlobalSkeleton(
                  isLoading: controller.isLoading,
                  child: Consumer<AthleteManagementController>(
                    builder: (context, mdoel, child) {
                      return Column(
                        children: [
                          AppButton(onPressed: () {
                            print("-======e${model.rollAtheletList}");
                          }),
                          textProfileSettingAppbar(
                            context: context,
                            text: "Atlete",
                            isNotificationIcon: true,
                            isNotificationBool: model.isNotificationDetail,
                            numberOfNotification: "3",
                            isAtheletScreen: true,
                            isAtheletBool: model.isAtheletDetail,
                            atheletScreenOnTap: () {
                              model.isNotificationDetail = false;
                              model.isAtheletDetail = false;
                            },
                            notificationOnTap: () {
                              model.isAtheletDetail = false;
                              model.isNotificationDetail = true;

                              print("obt");
                              // print("object ${model.isNotificationDetail}");
                            },
                          ),

                          if (model.isNotificationDetail == true) ...[
                            AppButton(onPressed: () {})
                          ] else ...[
                            primaryTextField(
                                hintText: "Ricerca",
                                prefixIcon:
                                    SvgPicture.asset(AssetUtils.searchIcon),
                                controller: model.searchController,
                                onChanged: (value) {},
                                border: InputBorder.none,
                                borderRadius: cw(50)),
                            SizedBox(
                              height: ch(20),
                            ),
                            _buildFilterChips(context, model),
                            SizedBox(
                              height: ch(20),
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  color: Color(0xFF2B2B2B),
                                  height: 1,
                                  thickness: 0.5,
                                ),
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemCount: model.rollAtheletList.length,
                                itemBuilder: (context, index) {
                                  final athlete = model.rollAtheletList[index];

                                  /// ✅ Safe name
                                  final String name = (athlete['fullName'] !=
                                              null &&
                                          athlete['fullName']
                                              .toString()
                                              .isNotEmpty)
                                      ? athlete['fullName']
                                      : '${athlete['firstName'] ?? ''} ${athlete['lastName'] ?? ''}'
                                          .trim();

                                  /// ✅ Role / Type
                                  final String type =
                                      athlete['user']?['role'] ?? 'athlete';

                                  /// ✅ Status
                                  final String status =
                                      athlete['onboardingCompleted'] == true
                                          ? 'Active'
                                          : 'Inactive';

                                  /// ✅ Last check-in
                                  final String lastCheckin =
                                      athlete['createdAt']
                                              ?.toString()
                                              .split('T')
                                              .first ??
                                          '';

                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: ch(10)),
                                    child: AthleteListTile(
                                      expiryDate: "exp oct 20",
                                      name: name, // ✅ FIXED
                                      status: status, // ✅ FIXED
                                      type: type, // ✅ FIXED
                                      lastCheckin: lastCheckin, // ✅ FIXED
                                      imageUrl: AssetUtils.avatar,
                                      onTap: () {
                                        print({"${name}"});
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) =>
                                        //      AthleteProfileView(
                                        //         athlete: athlete),
                                        //   ),
                                        // );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],

                          // Expanded(
                          //   child: ListView.separated(
                          //       separatorBuilder: (context, index) => Padding(
                          //             padding: EdgeInsets.only(
                          //                 left: cw(0), right: cw(0)),
                          //             child: const Divider(
                          //                 color: Color(0xFF2B2B2B),
                          //                 height: 1,
                          //                 thickness: 0.5),
                          //           ),
                          //       padding: EdgeInsets.zero,
                          //       physics: const BouncingScrollPhysics(),
                          //       itemCount: model.athletes.length,
                          //       itemBuilder: (context, index) {
                          //         final athlete = model.athletes[index];
                          //         final fullAthleteData = model.athletes;
                          //         return Padding(
                          //           padding:
                          //               EdgeInsets.symmetric(vertical: ch(10)),
                          //           child: AthleteListTile(
                          //               expiryDate: "exp oct 20",
                          //               name: athlete['name']!,
                          //               status: athlete['status']!,
                          //               type: athlete['type']!,
                          //               onTap: () {
                          //                 Navigator.push(
                          //                   context,
                          //                   MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         AthleteProfileView(
                          //                             athlete: fullAthleteData[
                          //                                 index]),
                          //                   ),
                          //                 );
                          //               },
                          //               lastCheckin: athlete['lastCheckin']!,
                          //               imageUrl: AssetUtils.avatar),
                          //         );
                          //       }),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ))),
    );
  }
}

Widget _buildFilterChips(
    BuildContext context, AthleteManagementController model) {
  return Consumer<AthleteManagementController>(
    builder: (context, model, child) {
      return SingleChildScrollView(
        scrollDirection:
            Axis.horizontal, // To match the image's horizontal scroll behavior
        child: Row(
          // Using Row inside SingleChildScrollView to force horizontal scroll
          children: model.filterOptions.map((String choice) {
            return Padding(
              padding: EdgeInsets.only(right: cw(10)), // Space between chips
              child: ChoiceChip(
                label: Text(choice),
                selected: model.selectedFilter == choice,
                onSelected: (bool selected) {
                  if (selected) {
                    model.setFilter(
                        choice); // Update the state in the controller
                  }
                },
                // --- Styling to match the design ---
                labelStyle: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.f15,
                ),
                selectedColor: AppColor.red, // Selected chip background is Red
                //backgroundColor: const Color(0xFF1C1C1C), // Unselected chip background is Dark Grey
                padding:
                    EdgeInsets.symmetric(horizontal: cw(8), vertical: ch(2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cw(20)),
                  side: model.selectedFilter == choice
                      ? BorderSide.none
                      : const BorderSide(
                          color: Color(0xFF333333),
                          width: 1.0), // Subtle border for unselected
                ),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}
