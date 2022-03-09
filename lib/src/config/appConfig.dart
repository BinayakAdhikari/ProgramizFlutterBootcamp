// Colors
import 'dart:ui';

import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: pureWhite,
        ),
        headline2: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: whiteLight,
        ),
        headline3: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: whiteLight,
        ),
        headline4: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: whiteLight,
        ),
        headline5: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: whiteLight,
        ),
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: whiteLight,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: whiteLight,
        ),
      ));
}

// Colors
const Color primary = Color(0xFF49eff2);
const Color blackDark = Color(0xFF141414);
const Color black = Color(0xFF1c1c1c);
const Color blackLight = Color(0xFF262626);
const Color pureWhite = Color(0xFFFFFFFF);
const Color whiteLight = Color(0xFFf0f0f0);
const Color white = Color(0xFFededed);

const Color rain = Color(0x6649eff2);
const Color cloud = Color(0x668f8f8f);
const Color sun = Color(0x66fff5a6);
// Urls
const String baseUrl = "https://api.openweathermap.org/data/2.5/onecall";
