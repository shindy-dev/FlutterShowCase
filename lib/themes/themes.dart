import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCaseTheme {
  static final VisualDensity _visualDensity =
      VisualDensity.adaptivePlatformDensity;

  static final PageTransitionsTheme _pageTransitionsTheme =
      PageTransitionsTheme(builders: {
    for (TargetPlatform platform in [
      TargetPlatform.linux,
      TargetPlatform.android,
      TargetPlatform.fuchsia,
      TargetPlatform.iOS,
      TargetPlatform.macOS,
      TargetPlatform.windows,
    ])
      platform: ZoomPageTransitionsBuilder()
  });

  static ThemeData _getTheme(Color color, {bool isDark = false}) {
    final ThemeData themeData = (isDark ? ThemeData.dark() : ThemeData.light());
    return themeData.copyWith(
      primaryColor: color,
      accentColor: color,
      visualDensity: _visualDensity,
      toggleableActiveColor: color,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        colorScheme: themeData.colorScheme.copyWith(
          primary: color,
          secondary: Colors.white,
        ),
      ),
      pageTransitionsTheme: _pageTransitionsTheme,
      dividerColor: color,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  static ThemeData light(MaterialColor color) => _getTheme(color.shade500);

  static ThemeData dark(MaterialColor color) =>
      _getTheme(color.shade800, isDark: true);
}
