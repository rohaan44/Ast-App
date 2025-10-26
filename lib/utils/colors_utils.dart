import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColor {
  AppColor._();

  // Primary Palette
  static const c2C2C32 = Color(0xFF2C2C32);
    static const c656565 = Color(0xFF656565);
  static const Color background = Color(0xFF121212);
  static const red = Color(0xffFF3A2F); // Error
  static const blue = Color(0xff4D9BDA);
  static const c231F20 = Color(0xff231F20);
 static const c161616 = Color(0xff161616);
 static const c1E1E1E = Color(0xff1E1E1E);
  static const brown = Color(0xff8B6E4A);
  static const cFFB236 = Color(0xffFFB236);
  static const c336255 = Color(0xff336255);
  static const darkblue = Color(0xff346094);
  static const beige = Color(0xffB8A999);
  static const white = Color(0xffffffff);
  static const whiteShadow = Color(0xff9facb9);
  static const black = Color(0xff000000);
  static const grey = Color(0xff8B8B8B);
  static const yellow = Color(0xffEABF56); // Warning
  static const green = Color(0xff449857); // Success
  static const cf2f4f5 = Color(0xffF2F4F5);
  static const cE8E9E9 = Color(0xffE8E9E9);
  static const c252525 = Color(0xff252525);
  static const c454545 = Color(0xff454545);
    static const c42A8FF = Color(0xff42A8FF);
  // Gray Scale Palette
  static const transparent = Colors.transparent;

static const Color c1C1C1C = Color(0xFF1C1C1C); // A dark grey/black
    static const Color c333333 = Color(0xFF333333); // A slightly lighter grey for the icon circle
    static const Color cB0B0B0 = Color(0xFFB0B0B0); // A light grey for the subtitle

  // Color Code
  static const c6F6F6F = Color(0xff6F6F6F);
  static const c45C8DA = Color(0xff45C8DA);
  static const cFFC9C9 = Color(0xffFFC9C9);
  static const cFEFEFE = Color(0xffFEFEFE);
  static const cF3F3F3 = Color(0xffF3F3F3);
  static const cF3F5F9 = Color(0xffF3F5F9);
  static const cEAEAEA = Color(0xffEAEAEA);
  static const c008CFF = Color(0xff008CFF);

  static const c101010 = Color(0xff101010);
  static const c5A5A58 = Color(0xff5A5A58);
  static const c848484 = Color(0xff848484);
  static const c383838 = Color(0xff383838);
  static const c4E5357 = Color(0xff4E5357);
  static const c82888C = Color(0xff82888C);
  static const cF1F1F1 = Color(0xffF1F1F1);
  static const cD9D9D9 = Color(0xffD9D9D9);
  static const cEE312A = Color(0xffEE312A);
  static const c404040 = Color(0xff404040);
  static const c2F976A = Color(0xff2F976A);
  static const cB5B5B5 = Color(0xffB5B5B5);
  static const cD42F30 = Color(0xffD42F30);
  static const c9D9D9D = Color(0xff9d9d9d);
  static const c8B8B8B = Color(0xff8B8B8B);
  static const c1D1D1B = Color(0xff1D1D1B);
  static const c00F659 = Color(0xff00F659);
  static const cEEEEEE = Color(0xffEEEEEE);
  static const c8A8A8A = Color(0xff8A8A8A);
  static const c5E5E5E = Color(0xff5E5E5E);
  static const c5B5F94D = Color(0xffB5F94D);
  static const cDDDDDD = Color(0xffDDDDDD);
  static const cACACAB = Color(0xffACACAB);
  static const cf5f5f5 = Color(0xfff5f5f5);
  static const c323232 = Color(0xff323232);
  static const cABABAB = Color(0xffABABAB);
  static const c060030 = Color(0xff060030);
  static const c0078ff = Color(0xff0078ff);
  static const cFF3E33 = Color(0xffFF3E33);
  static const cE5E5E5 = Color(0xffE5E5E5);
  static const c83F8DE = Color(0xff83F8DE);
  static const c97FBB9 = Color(0xff97FBB9);
  static const cA1FB95 = Color(0xffA1FB95);
  static const c898989 = Color(0xff898989);
  static const c2A2D19 = Color(0xff2A2D19);
  static const cF5F5F5 = Color(0xffF5F5F5);
  static const c99FFBE = Color(0xff99FFBE);
  static const cFCE6E6 = Color(0xffFCE6E6);
  static const cE95858 = Color(0xffE95858);
  static const c449857 = Color(0xff449857);
  static const c449847 = Color(0xff449847);
  static const c00D600 = Color(0xff00D600);
  static const fcbe62 = Color(0xffFCBE62);
  static const c006E76 = Color(0xff006E76);
  static const c171717 = Color(0xff171717);
  static const cFFF7EF = Color(0xffFFF7EF);
  static const c202020 = Color(0xff202020);
  static const cFAFAFA = Color(0xffFAFAFA);
  static const cF8D9D9 = Color(0xffF8D9D9);
  static const cEEFEE5 = Color(0xffEEFEE5);
  static const cFBFBFB = Color(0xffFBFBFB);
  static const cF4F4F4 = Color(0xffF4F4F4);
  static const c0081B2 = Color(0xff0081B2);
  static const c00F858 = Color(0xff00F858);
  static const c00C164 = Color(0xff00C164);
  static const c000000 = Color(0xff000000);
  static const c5D5D5D = Color(0xff5D5D5D);
  static const c2F80ED = Color(0xff2F80ED);
  static const c5B4B4B4 = Color(0xffB4B4B4);
  static const c89B6AB = Color(0xff89B6AB);
  static const c9FACB9 = Color(0xff9FACB9);
  static const cFCBE62 = Color(0xffFCBE62);
  static const c0B5AC3 = Color(0xff0B5AC3);
  static const c4A4A4A = Color(0xff4A4A4A);
  static const cFAF9F6 = Color(0x33FFFFFF);
  static const cC6C6C6 = Color(0xffC6C6C6);
  static const c5CFF98 = Color(0xff5CFF98);
  static const cB4B4B4 = Color(0xffB4B4B4);
  static const cBDFDC0 = Color(0xffBDFDC0);
  static const cFFFFFF = Color(0xffFFFFFF);
  static const c007077 = Color(0xff007077);
  static const c2D2667 = Color(0xff2D2667);
  static const cc3c3c3 = Color(0xffc3c3c3);
  static const c878787 = Color(0xff878787);
  static const cE1E1E1 = Color(0xffE1E1E1);

  static const c03D34E = Color(0xff03D34E);
  static const c11E25C = Color(0xff11E25C);
  static const primary = Color(0xffFF3A2F);
  static const c66151F = Color(0xff66151F);
  static const c483312 = Color(0xff483312);
  static const c162F28 = Color(0xff162F28);
  static const c151515 = Color(0xff151515);
  static const c121212 = Color(0xff121212);
}
