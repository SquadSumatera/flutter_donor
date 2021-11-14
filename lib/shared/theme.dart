import 'package:flutter/material.dart';

class AppColor {
  // usage: AppColor.richBlack
  static const Color richBlack = Color(0xFF0B090A);
  static const Color bloodRed = Color(0xFF660708);
  static const Color eerieBlack = Color(0xFF161A1D);
  static const Color rubyRed = Color(0xFF161A1D);
  static const Color carnelian = Color(0xFFBA181B);
  static const Color imperialRed = Color(0xFFDC2626);
  static const Color silverChalice = Color(0xFFB1A7A6);
  static const Color lightGrey = Color(0xFFD3D3D3);
  static const Color cultured = Color(0xFFF5F3F4);
  static const Color white = Color(0xFFFFFFFF);

  // noted Ojo dibusak
  static const Color cDarkBlue = Color(0xFF2B2E4A);
  static const Color cRed = Color(0xFFE84545);
  static const Color cPurple = Color(0xFF903749);
  static const Color cGrey = Color(0xFFCFCFCF);
  static const Color cLightGrey = Color(0XFFF2F2F2);
  static const Color cOrange = Color(0XFFF37024);
  static const Color cBlue = Color(0XFF458FF6);
  static const Color cBlack = Color(0xFF000000);
  static const Color cGreen = Color(0XFF0CB569);
}

class AppText {
  static const String fontFamily = "OpenSans";

  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // usage: Text("lipsum", style: AppText.red)
  static const TextStyle textExtraSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 8,
  );
  static const TextStyle textSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
  );
  static const TextStyle textNormal = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
  );
  static const TextStyle textMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
  );
  static const TextStyle textSemiLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
  );
  static const TextStyle textLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
  );
}
