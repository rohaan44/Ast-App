import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_profile/athelete_profile_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/listtile/athelet_notification_listtile.dart';
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
    model.setContext(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (model.coachesList.isEmpty && !model.isLoading) {
        model.getAllMyAtheletes(context: context);
      }

      // Future.delayed(const Duration(minutes: 1), () {
      //   controller.getAtheletPendingRequest(context: context);
      // });
    });

    return Scaffold(
      body: SafeArea(
          child: GlobalSkeleton(
        isLoading: model.isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              // textProfileSettingAppbar(
              //     context: context,
              //     text: "Atlete",
              //     isNotificationIcon: true,
              //     isNotificationScreen: model.isNotificationScreen,
              //     notificationOnTap: () {
              //       model.isAtheletScreen = false;
              //       model.isNotificationScreen = true;
              //     },
              //     isAtheletIcon: true,
              //     isAtheletScreen: model.isAtheletScreen,
              //     atheletScreenOnTap: () {
              //       model.isAtheletScreen = true;
              //       model.isNotificationScreen = false;
              //     }),
              if (!model.isAtheletScreen) ...[
                primaryTextField(
                    hintText: "Ricerca",
                    prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
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
                      separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: cw(0), right: cw(0)),
                            child: const Divider(
                                color: Color(0xFF2B2B2B),
                                height: 1,
                                thickness: 0.5),
                          ),
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: model.athletes.length,
                      itemBuilder: (context, index) {
                        final athlete = model.athletes[index];
                        final fullAthleteData = model.athletes;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: ch(10)),
                          child: AthleteListTile(
                              expiryDate: "exp oct 20",
                              name: athlete['name']!,
                              status: athlete['status']!,
                              type: athlete['type']!,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AthleteProfileView(
                                        athlete: fullAthleteData[index]),
                                  ),
                                );
                              },
                              lastCheckin: athlete['lastCheckin']!,
                              imageUrl: AssetUtils.avatar),
                        );
                      }),
                ),
              ] else if (model.isNotificationScreen) ...[
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: cw(0), right: cw(0)),
                            child: const Divider(
                                color: Color(0xFF2B2B2B),
                                height: 1,
                                thickness: 0.5),
                          ),
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: model.athletes.length,
                      itemBuilder: (context, index) {
                        final athlete = model.athletes[index];
                        final fullAthleteData = model.athletes;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: ch(10)),
                          child: AthleteNotificationTile(
                              expiryDate: "exp oct 20",
                              name: athlete['name']!,
                              status: athlete['status']!,
                              type: athlete['type']!,
                              accepOnTap: () {
                                // print("object");
                                // model.acceptReqAthelet(context, "accept");
                              },
                              rejectOnTap: () {
                                // model.rejectReqAthelet(context, "reject");
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AthleteProfileView(
                                        athlete: fullAthleteData[index]),
                                  ),
                                );
                              },
                              lastCheckin: athlete['lastCheckin']!,
                              imageUrl: AssetUtils.avatar),
                        );
                      }),
                ),
              ],
            ],
          ),
        ),
      )),
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
