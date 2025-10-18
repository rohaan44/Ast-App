import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.background,
    // primaryColor: AppColor.primary,
    colorScheme: const ColorScheme.dark(
      background: AppColor.background,
      // primary: AppColors.primary,
      // secondary: AppColors.secondary,
      // surface: AppColors.secondary,
      // error: AppColors.error,
    ),
    fontFamily: 'SF-Pro',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: AppFontSize.f24,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      displayMedium: TextStyle(
        fontSize: AppFontSize.f20,
        fontWeight: FontWeight.w600,
        color: AppColor.white,
      ),
      displaySmall: TextStyle(
        fontSize: AppFontSize.f18,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      // bodyLarge: TextStyle(
      //   fontSize: AppFontSize.f16,
      //   color: AppColors.grey,
      // ),
      // bodyMedium: TextStyle(
      //   fontSize: AppFontSize.f14,
      //   color: AppColors.grey,
      // ),
      // bodySmall: TextStyle(
      //   fontSize: AppFontSize.f12,
      //   color: AppColors.grey,
      // ),
      // labelLarge: TextStyle(
      //   fontSize: AppFontSize.f14,
      //   fontWeight: FontWeight.w600,
      //   color: AppColors.white,
      // ),
    ),
    appBarTheme: AppBarTheme(
      // backgroundColor: AppColor.background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: AppFontSize.f18,
        fontWeight: FontWeight.w600,
        color: AppColor.white,
      ),
      iconTheme: const IconThemeData(color: AppColor.white),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary,
    //     foregroundColor: AppColors.white,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     textStyle: TextStyle(
    //       fontFamily: 'SF-Pro',
    //       fontSize: AppFontSize.f14,
    //       fontWeight: FontWeight.w600,
    //     ),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.lightGrey,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: BorderSide.none,
    //   ),
    //   hintStyle: TextStyle(
    //     color: AppColors.grey,
    //     fontSize: AppFontSize.f14,
    //   ),
    //   labelStyle: TextStyle(
    //     color: AppColors.grey,
    //     fontSize: AppFontSize.f14,
    //   ),
    // ),
  );
}