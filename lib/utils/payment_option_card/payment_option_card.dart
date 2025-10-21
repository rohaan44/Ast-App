import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:sizer/sizer.dart';

class PaymentOptionCard extends StatelessWidget {
  final String id;
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.id,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ch(54),
        margin: EdgeInsets.only(bottom: ch(12)),
        padding:  EdgeInsets.symmetric(horizontal: cw(16), ),
        decoration: BoxDecoration(
          color: AppColor.c161616,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(
          //   color: isSelected ? AppColor.white : Colors.transparent,
          //   width: 1.8,
          // ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, height: 22),
            SizedBox(width: cw(12)),
            Expanded(
              child: AppText(
                txt: title,
                fontSize: 14.8.sp,
                color: AppColor.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Radio<String>(
              value: id,
              groupValue: isSelected ? id : null,
              onChanged: (_) => onTap(),
              activeColor: AppColor.primary,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (states) => states.contains(MaterialState.selected)
                    ? AppColor.white
                    : AppColor.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
