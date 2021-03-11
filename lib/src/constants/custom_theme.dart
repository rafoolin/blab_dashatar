import 'package:flutter/material.dart';

enum CustomTheme { LIGHT, BEIGE, DARK }

extension CustomThemeExtension on CustomTheme {
  // Name of the theme Data.
  String get name {
    switch (this) {
      case CustomTheme.LIGHT:
        return 'Light';
      case CustomTheme.BEIGE:
        return 'Beige';
      case CustomTheme.DARK:
      default:
        return "Dark";
    }
  }

  // Custom Theme data.
  ThemeData get themeData {
    switch (this) {
      case CustomTheme.LIGHT:
        return ThemeData(
          brightness: Brightness.light,
          primaryColorLight: const Color(0xff86b7fa),
          primaryColor: const Color(0xff3c8bf7),
          primaryColorDark: const Color(0xff0042a0),
          canvasColor: const Color(0xffffffff),
          scaffoldBackgroundColor: const Color(0xfff4f4f4),
          dialogBackgroundColor: const Color(0xfff4f4f4),
          cardColor: const Color(0xfff4f4f4),
          accentColor: const Color(0xffc37408),
          toggleableActiveColor: const Color(0xffc37408),
          errorColor: const Color(0xffff4e20),
          dividerColor: const Color(0xff9a9a9a),
          sliderTheme: SliderThemeData(
            activeTrackColor: const Color(0xffc37408),
            overlayColor: const Color.fromRGBO(195, 116, 8, 0.15),
            thumbColor: const Color(0xffc37408),
            valueIndicatorColor: const Color(0xffa0600e),
            inactiveTrackColor: const Color(0xfff3cfaf),
            inactiveTickMarkColor: const Color(0xff40280f),
          ),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black87),
            bodyText2: TextStyle(
              color: Color(0xffe95b36),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      case CustomTheme.BEIGE:
        return ThemeData(
          brightness: Brightness.light,
          primaryColorLight: const Color(0xffe6cca7),
          primaryColor: const Color(0xffd7b37d),
          primaryColorDark: const Color(0xffc79549),
          canvasColor: const Color(0xffedd8bd),
          scaffoldBackgroundColor: const Color(0xffedd8bd),
          cardColor: const Color(0xffedd8bd),
          dialogBackgroundColor: const Color(0xffedd8bd),
          accentColor: const Color(0xff284c82),
          toggleableActiveColor: const Color(0xff284c82),
          errorColor: const Color(0xffd40000),
          dividerColor: const Color(0xffaaaaaa),
          sliderTheme: SliderThemeData(
            activeTrackColor: const Color(0xff284c82),
            overlayColor: const Color.fromRGBO(40, 76, 130, 0.15),
            thumbColor: const Color(0xff284c82),
            valueIndicatorColor: const Color(0xff25406b),
            inactiveTrackColor: const Color(0xffb9bfd4),
            inactiveTickMarkColor: const Color(0xff161d2c),
          ),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black87),
            bodyText2: TextStyle(
              color: Color(0xffd2366f),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        );

      case CustomTheme.DARK:
      default:
        return ThemeData(
          brightness: Brightness.dark,
          primaryColorLight: const Color(0xff2d2d2d),
          primaryColor: const Color(0xff242424),
          primaryColorDark: const Color(0xff1d1d1d),
          cardColor: const Color(0xff2d2d2d),
          dividerColor: const Color(0xff434343),
          accentColor: const Color(0xffde5285),
          toggleableActiveColor: const Color(0xffde5285),
          errorColor: const Color(0xff800000),
          sliderTheme: SliderThemeData(
            activeTrackColor: const Color(0xffde5285),
            overlayColor: const Color.fromRGBO(250, 200, 213, 0.15),
            thumbColor: const Color(0xffde5285),
            valueIndicatorColor: const Color(0xff8f3957),
            inactiveTrackColor: const Color.fromRGBO(250, 200, 213, 0.25),
            inactiveTickMarkColor: const Color(0xffffc2d2),
          ),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white70),
            bodyText2: TextStyle(
              color: Color(0xfff19cbb),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        );
    }
  }
}
