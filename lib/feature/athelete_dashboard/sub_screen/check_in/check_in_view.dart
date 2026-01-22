import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ch(50)),
          child: _appBar(context: context),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              SizedBox(
                height: ch(15),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: cw(14), vertical: ch(14)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cw(20)),
                    color: AppColor.c171717),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: "Controllo settimanale!",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.2,
                        ),
                        AppText(
                          txt: "14 ago 2025",
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.cFFFFFF.withOpacity(0.7),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ch(5),
                    ),
                    AppText(
                      txt:
                          "Carica peso, foto e misure per tenere aggiornato\nil tuo coach.",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.2,
                      color: AppColor.cFFFFFF.withOpacity(0.7),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: ch(22),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetUtils.checkIcon),
                        SizedBox(
                          width: cw(5),
                        ),
                        AppText(
                          txt: "Completato",
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: ch(12),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.checkInDietView,
                  );
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            txt: "Il tuo prossimo check-in!",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1.2,
                          ),
                          AppText(
                            txt: "21 ago 2025",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.2,
                            color: AppColor.cFFFFFF.withOpacity(0.7),
                          ),
                        ],
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
                            borderRadius: BorderRadius.circular(cw(10)),
                            color: AppColor.c1E1E1E),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: cw(12)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_active,
                                size: 16,
                              ),
                              SizedBox(
                                width: cw(5),
                              ),
                              AppText(
                                txt: "4:00 PM",
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1.2,
                              ),
                              const Spacer(),
                              SvgPicture.asset(AssetUtils.arrowForward)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ch(12),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.checkInDietView,
                  );
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
                            shape: BoxShape.circle, color: AppColor.c252525),
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
                        txt: "È il momento del tuo check-in\nsettimanale!",
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
                          padding: EdgeInsets.symmetric(horizontal: cw(12)),
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
    );
  }
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
