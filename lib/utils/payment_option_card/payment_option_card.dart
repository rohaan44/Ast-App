import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';

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
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColor.c161616,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColor.primary : Colors.transparent,
            width: 1.8,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, height: 22),
            const SizedBox(width: 12),
            Expanded(
              child: AppText(
                txt: title,
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
                    ? AppColor.primary
                    : AppColor.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
