import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';

class AthleteNotificationTile extends StatelessWidget {
  final String name;
  final String status;
  final String type;
  final String expiryDate;
  final String lastCheckin;
  final String imageUrl;
  final VoidCallback? onTap; // Added for better reusability
  final VoidCallback? accepOnTap; // Added for better reusability
  final VoidCallback? rejectOnTap; // Added for better reusability

  const AthleteNotificationTile({
    super.key,
    required this.expiryDate,
    required this.name,
    required this.status,
    required this.type,
    required this.lastCheckin,
    required this.imageUrl,
    required this.accepOnTap,
    required this.rejectOnTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: cw(28),
              backgroundImage: AssetImage(imageUrl),
              backgroundColor: const Color(0xFF333333),
            ),
            SizedBox(
              width: cw(16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: name,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.f19,
                  height: 1.5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      txt: 'Ultimo check-in ',
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: AppFontSize.f15,
                      height: 1.2,
                    ),
                    AppText(
                      txt: lastCheckin,
                      fontSize: AppFontSize.f15,
                    ),
                  ],
                ),
                AppText(
                  txt: '$type $expiryDate',
                  color: AppColor.white.withOpacity(0.54),
                  fontSize: AppFontSize.f15,
                  height: 1.5,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: accepOnTap,
                      child: Container(
                        width: cw(40),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColor.green.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(cw(5))),
                        child: Center(
                          child: AppText(
                            txt: 'Accept',
                            color: AppColor.white.withOpacity(0.7),
                            fontSize: AppFontSize.f15,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: cw(12),
                    ),
                    InkWell(
                      onTap: rejectOnTap,
                      child: Container(
                        width: cw(40),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColor.primary.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(cw(5))),
                        child: Center(
                          child: AppText(
                            txt: 'Reject',
                            color: AppColor.white.withOpacity(0.7),
                            fontSize: AppFontSize.f15,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
