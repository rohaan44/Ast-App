import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/helpers/input_formatters_helpers.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

Widget primaryTextField({
  required String hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
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
  double? borderRadius,
  double? textFieldHeight,
  double? containerPadding,
  int? maxLines,
}) {
  final fieldHeight = textFieldHeight ?? ch(52);
  final isTall = fieldHeight > ch(60); // 👈 agar height zyada hai to top align

  return Container(
    height: fieldHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(cw(borderRadius ?? 14)),
      border: Border.all(color: AppColor.c252525),
      color: fillColor ?? AppColor.c151515,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: prefixIcon != null ? cw(10) : cw(16),
      ),
      child: Align(
        alignment: isTall
            ? Alignment.topCenter
            : Alignment.center, // 👈 smart alignment
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: AppColor.red,
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          autofocus: autoFocus,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: obscureText ? 1 : maxLines,
          inputFormatters: inputFormatters ??
              InputFormatterHelper.allowCharactersNumbersAndSpace,
          style: textStyle ??
              TextStyle(
                color: AppColor.white,
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.w500,
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
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: AppFontSize.f15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.cFFFFFF.withOpacity(0.5),
                ),

            // ✅ Prefix icon
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: cw(8)),
                    child: prefixIcon,
                  )
                : null,
            prefixIconConstraints: prefixIcon != null
                ? BoxConstraints(
                    minWidth: cw(24),
                    minHeight: ch(24),
                  )
                : const BoxConstraints(),

            // ✅ Suffix icon
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: cw(8)),
                    child: suffixIcon,
                  )
                : null,
            suffixIconConstraints: suffixIcon != null
                ? const BoxConstraints()
                : const BoxConstraints(),

            isDense: true,
            contentPadding: EdgeInsets.only(
              top:
                  isTall ? ch(10) : 0, // 👈 agar height zyada ho to top padding
              bottom: isTall ? 0 : ch(2),
            ),
          ),
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    ),
  );
}
