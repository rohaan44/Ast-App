import 'dart:developer';

import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/check_in_reviews/check_in_reviews_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_dismis_keyboard.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CheckInReviewsView extends StatelessWidget {
  const CheckInReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CheckInReviewsController>(context, listen: false);

    // controller.setContext(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (model.coachesList.isEmpty && !model.isLoading) {
        model.getCoahCheckInReview(context: context);
      }
    });

    return AppDismissKeyboard(
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: cw(
            20,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // textProfileSettingAppbar(
              //     context: context,
              //     text: "Recensioni del check-in",
              //     fontSize: AppFontSize.f24 - 4),
              primaryTextField(
                  hintText: "Ricerca",
                  prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                  controller: TextEditingController(),
                  // onChanged: controller.filterAthletes,
                  border: InputBorder.none,
                  borderRadius: cw(50)),
              SizedBox(
                height: ch(20),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildFilterChips(context, model),
                      SizedBox(
                        height: ch(20),
                      ),
                      _buildAthleteList(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

Widget _buildAthleteList(BuildContext context) {
  return Consumer<CheckInReviewsController>(
    builder: (context, model, child) {
      final athletes = model.filteredAthletes;
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: athletes.length,
        itemBuilder: (context, index) {
          final athlete = athletes[index];
          return buildAthleteTile(context, athlete, () {
            log(athletes[index].toString());
            context
                .read<FlowDataProvider>()
                .addOrUpdateFlow(flowTag: checkIn, data: athletes[index]);
            Navigator.pushNamed(context, RoutePaths.selectedCheckInScreen);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectedCheckInView()));
          });
        },
      );
    },
  );
}

Widget _buildFilterChips(BuildContext context, CheckInReviewsController model) {
  return Consumer<CheckInReviewsController>(
    builder: (context, model, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: model.filterOptions.map((String choice) {
            return Padding(
              padding: EdgeInsets.only(right: cw(10)), // Space between chips
              child: ChoiceChip(
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                selectedShadowColor: Colors.transparent,
                pressElevation: 0,
                elevation: 0,
                showCheckmark: false,
                disabledColor: Colors.transparent,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: AppColor.background,
                label: AppText(
                  txt: choice,
                  fontSize: AppFontSize.f16,
                ),
                selected: model.selectedFilter == choice,
                onSelected: (bool selected) {
                  if (selected) {
                    model.setFilter(choice);
                  }
                },
                labelStyle: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.f15,
                ),
                selectedColor: AppColor.red,
                padding:
                    EdgeInsets.symmetric(horizontal: cw(8), vertical: ch(2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cw(20)),
                  side: model.selectedFilter == choice
                      ? BorderSide.none
                      : const BorderSide(color: Color(0xFF333333), width: 1.0),
                ),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}

Widget buildAthleteTile(
    BuildContext context, Map<String, dynamic> athlete, void Function() ontap) {
  final bool reviewed = athlete["isReviewed"] ?? false;

  return Column(
    children: [
      ListTile(
        onTap: ontap,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: cw(25),
          backgroundImage: NetworkImage(athlete["imagePath"]),
        ),
        title: AppText(
          txt: athlete["name"],
          fontSize: AppFontSize.f16 + 2,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ch(10),
            ),
            AppText(
              txt: athlete["date"],
              fontSize: AppFontSize.f15,
              fontWeight: FontWeight.w400,
              color: AppColor.cFFFFFF.withOpacity(0.5),
            ),
            SizedBox(height: ch(10)),
            AppText(
              txt:
                  "Peso: ${athlete["weight"]} kg | Vita: ${athlete["waist"]} cm | Foto: ${athlete["photos"]}",
              fontSize: AppFontSize.f14 + 5,
              fontWeight: FontWeight.w400,
              color: AppColor.cFFFFFF.withOpacity(0.5),
            ),
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cw(20)),
            border: Border.all(
              color: reviewed ? AppColor.c5CCC6F : const Color(0xFF9B6A28),
            ),
            color: reviewed
                ? AppColor.c5CCC6F.withOpacity(0.1)
                : const Color(0xFF9B6A28).withOpacity(0.1),
          ),
          padding: EdgeInsets.symmetric(horizontal: cw(12), vertical: ch(4)),
          child: AppText(
            txt: reviewed ? "Recensito" : "In attesa di",
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.f14 + 1,
            color: reviewed ? AppColor.c5CCC6F : const Color(0xFF9B6A28),
          ),
        ),
      ),
      Divider(
        color: AppColor.cFFFFFF.withOpacity(0.1),
        thickness: 0.5,
        height: ch(10),
      ),
    ],
  );
}
