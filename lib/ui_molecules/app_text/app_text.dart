import 'package:ast_official/utils/colors_utils.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  AppText({
    Key? key,
    required this.txt,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.height,
    this.letterspacing,
    this.wordspacing,
    this.decoration,
    this.textStyle,
    this.maxLines,
    this.decorationColor,
    this.overflow,
  }) : super(key: key);
  final String txt;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  String? fontFamily;
  TextAlign? textAlign;
  double? height;
  TextDecoration? decoration;
  TextStyle? textStyle;
  double? letterspacing;
  double? wordspacing;
  int? maxLines;
  TextOverflow? overflow;

  Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      maxLines: maxLines ?? 10,
      overflow: overflow ?? TextOverflow.visible,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          TextStyle(
            // fontFamily: fontFamily ,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: color ?? AppColor.cFFFFFF,
            height: height ?? 1.0,
            letterSpacing: letterspacing ?? 0,
            wordSpacing: wordspacing ?? 0,
            decorationColor: decorationColor,
            decoration: decoration ?? TextDecoration.none,
          ),
    );
  }
}
