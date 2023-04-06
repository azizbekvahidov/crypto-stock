import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 24.0,
        color: Color(0xff00264D),
        fontWeight: FontWeight.w600,
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      //use for main text
      headline6: base.headline6!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      // use for textfield hint
      headline4: base.headline4!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: const Color(0xffffffff),
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      headline3: base.headline3!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: const Color(0xffffffff),
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      headline2: base.headline2!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 18.0,
        color: const Color(0xff121212),
        fontWeight: FontWeight.w600,
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      caption: base.caption!.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      bodyText1: base.bodyText2!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: const Color(0xFF2D2D2D),
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
      bodyText2: base.bodyText2!.copyWith(
        fontFamily: GoogleFonts.getFont("Poppins").fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF17181A),
        fontFeatures: [
          const FontFeature.enable("pnum"),
          const FontFeature.enable("lnum")
        ],
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    //textTheme: Typography().white,
    primaryColor: const Color(0xff17181A),
    hintColor: const Color(0xff878C90),
    indicatorColor: const Color(0xFF0152FE),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardColor: Color(0xff3C3F42),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff0B4789),
    ),
    primaryIconTheme: IconThemeData(
      color: Color(0xffffffff),
    ),
    splashColor: const Color(0xFF454545),
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primaryContainer: Color(0xffF4F6F9),
      secondaryContainer: Color(0xffEEF2F6),
      onBackground: Color(0xffE8E8E8),
      //info
      surface: Color(0xff121212),
      //success
      onPrimary: Color(0xffECFBF1),
      primary: Color(0xff61656A),
      //warning
      secondary: Color(0xffFFAD2E),
      onSecondary: Color(0xffffffff),
      //error
      onError: Color(0xFFFF9691),
      error: Color(0xFFE51919),
      background: Color(0xffFFDF00),
    ),
    bottomAppBarColor: Color(0xff5768FA),
  );
}
