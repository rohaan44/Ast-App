import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/helpers/input_formatters_helpers.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

Widget primaryTextField({
  required String hintText, // ✅ hint text required
  required Widget prefixIcon, // ✅ prefix required
  TextEditingController? controller,
  Function(String)? onChanged,
  Function()? onTap,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  bool obscureText = false,
  bool readOnly = false,
  int? maxLength,
  bool autoFocus = false,
  Color? fillColor,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  InputBorder? border,
  bool isBorderColor = false,
  Color? borderColor,
  FocusNode? focusNode,
}) {
  return Container(
    width: cw(327),
    height: ch(52),
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(cw(16)),
      border: Border.all(color: AppColor.c252525.withOpacity(0.5)),
      color: fillColor ?? AppColor.c151515,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: ch(16)),
      child: Center(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          autofocus: autoFocus,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          // cursorColor: AppColor.grey,
          cursorHeight: (2.3).h,
          maxLength: maxLength,
          inputFormatters: inputFormatters ??
              InputFormatterHelper.allowCharactersNumbersAndSpace,
          style: textStyle ??
              TextStyle(
                color: AppColor.white,
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.w600,
              ),
          decoration: InputDecoration(
            counterText: "",
            fillColor: fillColor ?? AppColor.c151515,
            filled: true,
            border: border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.white, width: cw(1)),
                ),
            enabledBorder: border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.white, width: cw(1)),
                ),
            focusedBorder: border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: isBorderColor
                        ? borderColor ?? AppColor.green
                        : AppColor.green,
                    width: cw(1),
                  ),
                ),
            hintText: hintText, // ✅ only hint text
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.5),
                ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: ch(8)),
              child: prefixIcon, // ✅ required
            ),
            prefixIconConstraints: const BoxConstraints(),
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: ch(4)),
          ),
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    ),
  );
}
