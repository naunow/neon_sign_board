import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonsignboard/constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: kPrimaryColor,
      accentColor: kAccentLightColor,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.light(
        secondary: kSecondaryLightColor,
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: kBodyTextColorLight),
      accentIconTheme: IconThemeData(color: kAccentIconLightColor),
      primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
      textTheme: GoogleFonts.yellowtailTextTheme().copyWith(
        bodyText1: TextStyle(color: kBodyTextColorLight),
        bodyText2: TextStyle(color: kBodyTextColorLight),
        subtitle1: TextStyle(color: kTitleTextLightColor, fontSize: 18),
        caption: TextStyle(color: kBodyTextColorLight, fontSize: 14),
        headline4: TextStyle(color: kBlueColor, fontSize: 32),
        headline1: TextStyle(color: kTitleTextLightColor, fontSize: 80),
      ));
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
