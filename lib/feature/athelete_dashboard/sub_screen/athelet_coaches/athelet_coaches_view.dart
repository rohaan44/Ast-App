import 'dart:developer';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_coaches/athelet_coaches_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/global_refresh_indicator/global_refresh_indicator.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AtheletCoachesView extends StatelessWidget {
  const AtheletCoachesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<AtheletCoachesController>(context, listen: false);
    controller.setContext(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.isFirstFetchDone && !controller.isLoading) {
        controller.getCoaches(context: context);
      }
    });
    return AppDismissKeyboard(
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(ch(60)),
            child: _appBar(context: context),
          ),
          body: Consumer<AtheletCoachesController>(
            builder: (context, model, child) {
              return Column(
                children: [
                  SizedBox(height: ch(12)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: cw(20)),
                    child: primaryTextField(
                      textFieldHeight: ch(46),
                      prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                      hintText: "Cerca",
                      borderRadius: cw(50),
                      border: InputBorder.none,
                      onChanged: (value) {
                        model.setSearchQuery(value);
                      },
                    ),
                  ),
                  SizedBox(height: ch(20)),
                  categorySelector(model),
                  SizedBox(height: ch(20)),
                  Expanded(
                    child: GlobalRefreshIndicator(
                      onRefresh: () async {
                        await model.getCoaches(context: context);
                      },
                      child: GlobalSkeleton(
                        isLoading:
                            model.isFirstLoading && model.coachesList.isEmpty,
                        child: ListView.separated(
                          key: const PageStorageKey('athelet_coaches_list'),
                          controller: model.scrollController,
                          padding: EdgeInsets.symmetric(horizontal: cw(20)),
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: model.filteredCoaches.length +
                              (model.isLoadingMore ? 1 : 0),
                          separatorBuilder: (_, index) {
                            return SizedBox(height: ch(12));
                          },
                          itemBuilder: (context, index) {
                            if (index == model.filteredCoaches.length) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: ch(20)),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.primary,
                                  ),
                                ),
                              );
                            }
                            final coach = model.filteredCoaches[index];
                            if (coach == null) return const SizedBox.shrink();
                            final img = coach["avatar"] ?? "";
                            String title = coach["fullName"] ?? "Anonymous";
                            final String subTitle = coach["bio"] ?? "";
                            final String gender = coach["gender"] ?? "";
                            final String? coachId = coach["_id"]?.toString() ??
                                coach["id"]?.toString();
                            final Map<String, dynamic>? user =
                                coach['user'] is Map ? coach['user'] : null;
                            final String? userId = user != null
                                ? user['_id']?.toString()
                                : coachId;

                            if (title.isEmpty || title == "Anonymous") {
                              if (userId != null && userId.length >= 8) {
                                title = "Anonymous ${userId.substring(0, 8)}";
                              }
                            }
                            return InkWell(
                              onTap: () {
                                log(coach["_id"].toString());
                                log(coach.toString());
                                context
                                    .read<FlowDataProvider>()
                                    .addOrUpdateFlow(
                                        flowTag: coachProfile,
                                        data: {
                                      "id": coach["_id"].toString(),
                                      "map": coach,
                                    });
                                Navigator.pushNamed(
                                    context, RoutePaths.coachProfileView);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (gender == "male") ...[
                                    Container(
                                      height: ch(44),
                                      width: cw(44),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          SvgPicture.asset(AssetUtils.maleIcon),
                                    ),
                                  ] else if (gender == "female") ...[
                                    Container(
                                        height: ch(44),
                                        width: cw(44),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                            AssetUtils.femaleIcon)),
                                  ] else
                                    Container(
                                      height: ch(44),
                                      width: cw(44),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: (img.isNotEmpty &&
                                              img.startsWith("http"))
                                          ? ClipOval(
                                              child: Image.network(
                                                img,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    SvgPicture.asset(
                                                        AssetUtils.maleIcon),
                                              ),
                                            )
                                          : SvgPicture.asset(
                                              AssetUtils.maleIcon),
                                    ),
                                  SizedBox(width: cw(8)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: title,
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppFontSize.f19,
                                      ),
                                      SizedBox(height: ch(5)),
                                      AppText(
                                        txt: subTitle,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.cFFFFFF.withOpacity(0.7),
                                        fontSize: AppFontSize.f15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ch(110)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _appBar({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(height: ch(10)),
        Row(
          children: [
            AppText(
              txt: "Allenatori",
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.f22 + 1.5,
              height: 1.5,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, RoutePaths.athleteNotificationView);
              },
              child: Container(
                height: ch(40),
                width: cw(40),
                padding: EdgeInsets.all(cw(2)),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.c252525),
                    shape: BoxShape.circle,
                    color: AppColor.transparent),
                child: const Center(
                  child: Icon(Icons.notifications_none_outlined),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildChip(String label, int index, dynamic model) {
  final bool isSelected = model.selectedCategoryIndex == index;

  return InkWell(
    onTap: () => model.setSelectedCategory(index),
    child: AnimatedContainer(
      // height: ch(30),
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: ch(8)),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColor.c252525,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: AppText(
          txt: label,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColor.cFFFFFF,
        ),
      ),
    ),
  );
}

Widget categorySelector(dynamic model) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(0)),
    child: SizedBox(
      height: ch(30),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        scrollDirection: Axis.horizontal,
        itemCount: model.categories.length,
        itemBuilder: (context, index) {
          final label = model.categories[index];
          return _buildChip(label, index, model);
        },
      ),
    ),
  );
}
