import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.textColor,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.buttonStyle,
    this.textDecoration,
    this.color,
    this.buttonColor,
    this.isBorder = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.isButtonEnable = true,
    this.borderRadius,
    this.fromAuthScreen,
    this.textHeight,
    this.isRow = false,
    this.svg,
    this.boxShadow,
    this.showIcon = false,
    this.icon,
    this.iconSpacing = 8.0,
  });

  final String? text;
  final Color? textColor;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final bool isLoading;
  final TextDecoration? textDecoration;
  final Color? color;
  final Color? buttonColor;
  final bool isBorder;
  final Color? borderColor;
  final double borderWidth;
  final bool isButtonEnable;
  final double? borderRadius;
  final double? textHeight;
  final bool isRow;
  final Widget? svg;
  final bool? fromAuthScreen;

  // 🔹 New properties for icon support
  final bool showIcon;
  final Widget? icon;
  final double iconSpacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || !isButtonEnable
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.zero,
        width: width ?? double.infinity,
        height: height ?? ch(51),
        decoration: buttonStyle ??
            BoxDecoration(
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                      color: AppColor.c000000.withOpacity(0.10),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
              borderRadius: BorderRadius.circular(borderRadius ?? cw(12)),
              color: isButtonEnable
                  ? (buttonColor ?? AppColor.red)
                  : AppColor.c252525,
              border: isBorder
                  ? Border.all(
                      color: borderColor ?? AppColor.cFFF7EF,
                      width: borderWidth,
                    )
                  : null,
            ),
        child: child ??
            (!isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 🔹 Optional icon (centered with text)
                      if (showIcon && icon != null) ...[
                        icon!,
                        if (text != null) SizedBox(width: iconSpacing),
                      ],

                      if (text != null)
                        Text(
                          text!,
                          style: textStyle ??
                              TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: fontSize ?? 16,
                                color: isButtonEnable
                                    ? textColor ?? AppColor.white
                                    : AppColor.white.withOpacity(0.5),
                                fontWeight: fontWeight ?? FontWeight.w400,
                                decoration:
                                    textDecoration ?? TextDecoration.none,
                                letterSpacing: 0,
                                height: textHeight,
                              ),
                        ),

                      if (isRow && svg != null) ...[
                        const Spacer(),
                        svg!,
                      ],
                    ],
                  )
                : const CircularProgressIndicator(color: AppColor.white)),
      ),
    );
  }
}
