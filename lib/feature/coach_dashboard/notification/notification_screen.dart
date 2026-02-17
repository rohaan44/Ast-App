import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/coach_main_screen_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/listtile/athelet_notification_listtile.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<CoachMainScreenController>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(cw(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      highlightColor: AppColor.transparent,
                      focusColor: AppColor.transparent,
                      splashColor: AppColor.transparent,
                      icon: SvgPicture.asset(AssetUtils.backArrow),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      width: cw(20),
                    ),
                    AppText(
                      txt: "Notifiche",
                      fontSize: AppFontSize.f24,
                      isItalic: true,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutePaths.coachProfileSettingScreen);
                  },
                  child: SvgPicture.asset(
                    AssetUtils.profileIcon,
                    height: ch(40),
                  ),
                )
              ],
            ),
          ),

          _buildNotification(context: context, model: model),

          //   Expanded(child:
          //   SingleChildScrollView(
          //     physics:const BouncingScrollPhysics(),
          //     padding: EdgeInsets.symmetric(horizontal: cw(20)),
          //     child: Column(
          //       children: [
          //           notificationCard(title: "Check-in", title_2: " In Ritardo", subtitle: "L'atleta John Doe ha una causa in sospeso"),
          //       SizedBox(height: ch(15),),
          //       notificationCard(title: "Nuovo Piano: ", title_2: " Parte Superiore Del Corpo", subtitle: "L'intelligenza artificiale ha generato un nuovo piano"),
          //       SizedBox(height: ch(15),),
          //       notificationCard(title: "Check-in ", title_2: " inviato", subtitle: "L'atleta Jane Roe ha inviato"),

          //       ],
          //     ),
          //   ))
        ],
      ),
    );
  }
}

Widget notificationCard({
  required String title,
  required String title_2,
  required String subtitle,
}) {
  return Container(
    alignment: Alignment.center,
    height: ch(85),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: AppColor.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(cw(20)), // Rounded corners
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            width: cw(50),
            height: ch(50),
            padding: EdgeInsets.all(cw(15)),
            decoration: const BoxDecoration(
              color: AppColor.c252525,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AssetUtils.bellIcon,
              width: 18,
              height: 18,
            )),
        SizedBox(width: cw(16)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.f20 - 2,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: title_2,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.f20 - 2,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(4)),
              AppText(
                txt: subtitle,
                color: AppColor.white.withOpacity(0.5),
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildNotification({
  required BuildContext context,
  required CoachMainScreenController model,
}) {
  // final model = context.read<CoachMainScreenController>();

  return Expanded(
    child: ListView.separated(
        separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: cw(0), right: cw(0)),
              child: const Divider(
                  color: Color(0xFF2B2B2B), height: 1, thickness: 0.5),
            ),
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: model.athletes.length,
        itemBuilder: (context, index) {
          final athlete = model.athletes[index];
          final fullAthleteData = model.athletes;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: ch(10), horizontal: cw(20)),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AthleteProfileView(
                  //         athlete: fullAthleteData[index]),
                  //   ),
                  // );
                },
                lastCheckin: athlete['lastCheckin']!,
                imageUrl: AssetUtils.avatar),
          );
        }),
  );
}
