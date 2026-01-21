import 'package:ast_official/app_ui_helpers/app_router/app_router.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_detail/training_detail_view.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/training_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/global_refresh_indicator/global_refresh_indicator.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/shimmer.dart';
// import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TrainingView extends StatelessWidget {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TrainingViewController>();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          controller.hasMore &&
          !controller.isLoading) {
        controller.getAllExercises(context, loadMore: true);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.workoutPlans.isEmpty && !controller.isLoading) {
        controller.getAllExercises(context);
      }
    });
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ch(86)), child: _appBar()),
      body: GlobalRefreshIndicator(
        onRefresh: () => controller.getAllExercises(context),
        child: GlobalSkeleton(
          isLoading: controller.isLoading,
          child: Consumer<TrainingViewController>(
            builder: (context, model, child) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    // pinned: true,
                    expandedHeight: ch(214),
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      // collapseMode: CollapseMode.parallax,
                      // title: const Text(
                      //   "MyTube",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     letterSpacing: 1,
                      //   ),
                      // ),
                      background: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: cw(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AssetUtils.redStar),
                                SizedBox(
                                  width: cw(20),
                                ),
                                AppText(
                                  txt: "Suggerimento dell’AI",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                )
                              ],
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            Container(
                                height: ch(144),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage(AssetUtils.trainingCard)),
                                  borderRadius: BorderRadius.circular(cw(24)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: cw(18), right: cw(12), top: ch(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: cw(6),
                                                vertical: ch(5)),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        cw(50)),
                                                border: Border.all(
                                                    color: AppColor.cFF8B5C,
                                                    width: cw(0.5)),
                                                color: AppColor.cFE6D38),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AssetUtils.icon1,
                                                  height: ch(14),
                                                  width: cw(14),
                                                  fit: BoxFit.contain,
                                                ),
                                                SizedBox(
                                                  width: cw(5),
                                                ),
                                                AppText(
                                                  txt: "01 ora",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: cw(10),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: cw(6),
                                                vertical: ch(5)),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        cw(50)),
                                                border: Border.all(
                                                    color: AppColor.cFF8B5C,
                                                    width: cw(0.5)),
                                                color: AppColor.cFE6D38),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AssetUtils.whiteFireIcon,
                                                  height: ch(14),
                                                  width: cw(14),
                                                  fit: BoxFit.contain,
                                                ),
                                                SizedBox(
                                                  width: cw(5),
                                                ),
                                                AppText(
                                                  txt: "130 kcal",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      AppText(
                                        txt: "Allenamento di corsa",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: ch(12),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: cw(12),
                                                vertical: ch(8)),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        cw(50)),
                                                border: Border.all(
                                                    color: AppColor.cFF8B5C,
                                                    width: cw(1)),
                                                color: AppColor.cFE6D38),
                                            child: Center(
                                              child: AppText(
                                                txt: "Principiante",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: cw(12),
                                          ),
                                          AppText(
                                            txt: "3 serie di esercizi",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(AssetUtils.playIcon),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Sticky horizontal categories (like YouTube chips)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CategoryHeaderDelegate(model),
                  ),

                  // 🔹 Main scrollable content
                  SliverToBoxAdapter(
                    child: cardGridView(model: model),
                  ),

                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (context, index) => Container(
                  //       margin: const EdgeInsets.symmetric(
                  //         horizontal: 16,
                  //         vertical: 8,
                  //       ),
                  //       height: 100,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         borderRadius: BorderRadius.circular(12),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withOpacity(0.05),
                  //             blurRadius: 6,
                  //             offset: const Offset(0, 3),
                  //           ),
                  //         ],
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             width: 120,
                  //             height: double.infinity,
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade300,
                  //               borderRadius: const BorderRadius.horizontal(
                  //                 left: Radius.circular(12),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(width: 12),
                  //           Expanded(
                  //             child: Text(
                  //               "Video item #${index + 1}",
                  //               style: const TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     childCount: 15,
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _appBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(
          height: ch(40),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: "Lunedì, 25 Ago",
                  fontWeight: FontWeight.w200,
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                  fontSize: 12,
                  height: 1.5,
                ),
                AppText(
                  txt: "L’allenamento di oggi",
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                  fontSize: 18,
                  height: 1.5,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: ch(50),
              width: cw(50),
              padding: EdgeInsets.all(cw(2)),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.c252525),
                  shape: BoxShape.circle,
                  color: AppColor.transparent),
              child: const Center(
                child: Icon(Icons.notifications_none_outlined),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final dynamic
      model; // <-- model pass karoge jisme categories list aur selectedIndex ho

  CategoryHeaderDelegate(this.model);

  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColor.background,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: model.categories.length,
        itemBuilder: (context, index) {
          return _buildChip(model.categories[index], index, model);
        },
      ),
    );
  }

  Widget _buildChip(String label, int index, dynamic model) {
    final bool isSelected = model.selectedCategoryIndex == index;

    return InkWell(
      onTap: () {
        model.setSelectedCategory(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColor.c252525,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: AppText(
          txt: label,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColor.cFFFFFF,
        )
            //  Text(
            //   label,
            //   style: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     fontSize: 12,
            //     color:  AppColor.cFFFFFF,
            //   ),
            // ),
            ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // rebuild when scroll or selection changes
  }
}

// class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   double get minExtent => 60;
//   @override
//   double get maxExtent => 60;

//   @override
//   Widget buildcat(
//       BuildContext context, double shrinkOffset, bool overlapsContent, model) {
//     return Container(
//       color: Colors.grey.shade100,
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: model.categories.length,
//         itemBuilder: (context, index) {
//           return _buildChip(model.categories[index], index,model);
//         },
//       ),
//     );
//     //  Container(
//     //   color: AppColor.background,
//     //   padding: const EdgeInsets.symmetric(vertical: 10),
//     //   child: ListView(
//     //     scrollDirection: Axis.horizontal,
//     //     padding: const EdgeInsets.symmetric(horizontal: 16),
//     //     children: [
//     //       _buildChip("Tutti", isSelected: true),
//     //       _buildChip("Cardio"),
//     //       _buildChip("Squat"),
//     //       _buildChip("Stretching"),
//     //       _buildChip("News"),
//     //       _buildChip("Movies"),
//     //       _buildChip("Tech"),
//     //       _buildChip("Sports"),
//     //     ],
//     //   ),
//     // );
//   }

//   // Widget _buildChip(String label, {bool isSelected = false}) {
//   //   return InkWell(
//   //     onTap: () {
//   //       isSelected = !isSelected;
//   //       UpdateShouldNotify;
//   //     },
//   //     child: Container(
//   //         margin: const EdgeInsets.only(right: 8),
//   //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//   //         decoration: BoxDecoration(
//   //           border: Border.all(color: AppColor.c252525),
//   //           color: isSelected ? AppColor.primary : AppColor.transparent,
//   //           borderRadius: BorderRadius.circular(20),
//   //         ),
//   //         child: Center(
//   //           child: AppText(
//   //             txt: label,
//   //             fontWeight: FontWeight.w500,
//   //             fontSize: 12,
//   //           ),
//   //         )),
//   //   );
//   // }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }

Widget cardGridView({
  required TrainingViewController model,
}) {
  return Column(
    children: [
      GridView.builder(
        itemCount: model.workoutPlans.length,
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(15)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: ch(10),
            mainAxisExtent: ch(253),
            mainAxisSpacing: cw(10)),
        itemBuilder: (context, index) {
          final title = model.workoutPlans[index]["title"];
          final subTitle = model.workoutPlans[index]["subTitle"];
          final img = model.workoutPlans[index]["img"];
          final date = model.workoutPlans[index]["date"];
          final difficultyLevel = model.workoutPlans[index]["difficultyLevel"];
          return InkWell(
            onTap: () {
              goTo(
                  context,
                  TrainingDetailView(
                      title: title,
                      subTitle: subTitle,
                      difficultyLevel: difficultyLevel,
                      date: date,
                      cardImg: img));
              //  Navigator.(context,
              //           RoutePaths.trainingDetailViw, (route) => false);
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                        cw(14),
                      ),
                      gradient: const LinearGradient(
                          colors: [AppColor.c000000, AppColor.c000000])),
                ),
                Positioned(
                    left: 8,
                    bottom: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: "$title .",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: ch(5),
                        ),
                        AppText(
                          txt: subTitle,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.cFFFFFF,
                        ),
                        SizedBox(
                          height: ch(14),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(6), vertical: ch(8)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(50)),
                                  color: AppColor.cFFFFFF.withOpacity(0.1)),
                              child: Center(
                                child: AppText(
                                  txt: difficultyLevel,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cw(4),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: cw(6), vertical: ch(8)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(50)),
                                  color: AppColor.cFFFFFF.withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetUtils.icon2,
                                    height: ch(10),
                                    width: cw(10),
                                  ),
                                  SizedBox(
                                    width: cw(4),
                                  ),
                                  AppText(
                                    txt: date,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
      SizedBox(
        height: ch(120),
      )
    ],
  );
}

// Widget _buildChip(String label, int index, model) {
//   bool isSelected = model.selectedIndex == index;

//   return InkWell(
//     onTap: () {
//       model.selectedIndex = index;
//       UpdateShouldNotify;
//     },
//     child: Container(
//       margin: const EdgeInsets.only(right: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.transparent,
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.grey.shade400,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 12,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     ),
//   );
// }
