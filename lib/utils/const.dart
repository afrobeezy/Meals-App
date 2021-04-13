import 'package:flutter/material.dart';
import 'package:mealsapp/helpers/custom_route.dart';

class Constants {
  static String appName = "Meal Bible";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blueGrey[900];
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    focusColor: darkPrimary,
    hoverColor: darkBG,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
        TargetPlatform.windows: CustomPageTransitionBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontFamily: 'RaleWay',
            fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            fontSize: 15,
            fontFamily: 'RaleWay',
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
              fontSize: 20, fontFamily: 'RaleWay', fontWeight: FontWeight.bold),
          subtitle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'RaleWay',
              fontWeight: FontWeight.bold),
        ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    focusColor: lightPrimary,
    hoverColor: lightBG,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
        TargetPlatform.windows: CustomPageTransitionBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.red,
            fontFamily: 'RaleWay',
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            fontSize: 15,
            fontFamily: 'RaleWay',
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
              fontSize: 20, fontFamily: 'RaleWay', fontWeight: FontWeight.bold),
          subtitle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'RaleWay',
              fontWeight: FontWeight.bold),
        ),
  );
}
