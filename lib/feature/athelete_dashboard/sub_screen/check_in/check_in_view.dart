import 'package:ast_official/feature/athelete_dashboard/sub_screen/check_in/check_in_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/global_refresh_indicator/global_refresh_indicator.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CheckInController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (model.checkinsResponse == null && !model.isLoading) {
        model.getCheckins(context: context);
      }
    });
    return GlobalRefreshIndicator(
        onRefresh: () async {
          model.getCheckins(context: context);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(ch(50)),
              child: _appBar(context: context),
            ),
            body: GlobalSkeleton(
              isLoading: model.isLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: ch(15),
                    ),
                    Consumer<CheckInController>(
                      builder: (context, controller, _) {
                        final checkIns =
                            controller.checkinsResponse?.data?.checkIns ?? [];
                        if (checkIns.isEmpty) {
                          return _emptyCheckInCard();
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: checkIns.length,
                          itemBuilder: (context, index) {
                            final checkIn = checkIns[index];

                            // Parse date and time from ISO 8601 format
                            String formattedDate = "";
                            String formattedTime = "";

                            if (checkIn.date != null) {
                              try {
                                final dateTime = DateTime.parse(checkIn.date!);
                                formattedDate =
                                    "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
                                formattedTime =
                                    "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
                              } catch (e) {
                                formattedDate =
                                    checkIn.date?.substring(0, 10) ?? "";
                              }
                            }

                            return _checkInCard(
                              date: formattedDate,
                              time: formattedTime,
                              notes: checkIn.notes,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: ch(12),
                    ),
                    InkWell(
                      onTap: () {
                        //   model.getCheckins(context: context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: cw(14), vertical: ch(14)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cw(20)),
                            color: AppColor.c171717),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: ch(38),
                              width: cw(38),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.c252525),
                              child: const Center(
                                child: Icon(
                                  Icons.notifications_active,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ch(8),
                            ),
                            AppText(
                              txt:
                                  "È il momento del tuo check-in\nsettimanale!",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(5),
                            ),
                            AppText(
                              txt:
                                  "Carica peso, foto e misure per tenere aggiornato il tuo\ncoach.",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.2,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: ch(22),
                            ),
                            Container(
                              height: ch(40),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(50)),
                                  color: AppColor.c252525),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: cw(12)),
                                child: Center(
                                  child: AppText(
                                    txt: "Inizia il check-in",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Widget _checkInCard({required String date, String? time, String? notes}) {
  return Container(
    margin: EdgeInsets.only(bottom: ch(12)),
    padding: EdgeInsets.symmetric(horizontal: cw(14), vertical: ch(14)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(cw(20)),
      color: AppColor.c171717,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Controllo settimanale!",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  txt: date,
                  fontSize: 12,
                  color: AppColor.cFFFFFF.withOpacity(0.7),
                ),
                if (time != null && time.isNotEmpty) ...[
                  SizedBox(height: ch(10)),
                  AppText(
                    txt: time,
                    fontSize: AppFontSize.f15, 
                    color: AppColor.cFFFFFF.withOpacity(0.5),
                  ),
                ],
              ],
            ),
          ],
        ),
        SizedBox(height: ch(5)),
        AppText(
          txt: notes ??
              "Carica peso, foto e misure per tenere aggiornato\nil tuo coach.",
          fontSize: 12,
          color: AppColor.cFFFFFF.withOpacity(0.7),
        ),
        SizedBox(height: ch(22)),
        Row(
          children: [
            SvgPicture.asset(AssetUtils.checkIcon),
            SizedBox(width: cw(5)),
            AppText(
              txt: "Completato",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _emptyCheckInCard() {
  return Center(
    child: AppText(
      txt: "No Check-Ins Yet",
      fontSize: AppFontSize.f18,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget _appBar({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(20)),
    child: Column(
      children: [
        SizedBox(height: ch(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: "Check-In",
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.f22,
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(AssetUtils.icon3),
            ),
          ],
        ),
      ],
    ),
  );
}
