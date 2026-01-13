// ignore_for_file: must_be_immutable

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class CusttomCheckBox extends StatelessWidget {
  double? height;

  double? width;
  Color? checkColor;
  bool isCheck = false;
  VoidCallback onTap;

  CusttomCheckBox({
    super.key,
    this.height,
    this.width,
    this.checkColor,
    required this.isCheck,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? ch(18),
        width: width ?? ch(18),
        decoration: BoxDecoration(
            color: isCheck
                ? AppColor.primary
                : (checkColor ?? AppColor.transparent),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: isCheck
                    ? AppColor.transparent
                    : AppColor.cFFFFFF.withOpacity(0.5))),
        child: isCheck
            ? const Center(
                child: Icon(
                Icons.check,
                size: 14,
                color: AppColor.black,
              ))
            : const SizedBox.shrink(),
      ),
    );
  }
}
