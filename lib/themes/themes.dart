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
    final ThemeData themeData = isDark ? ThemeData.dark() : ThemeData.light();
    return themeData.copyWith(
      primaryColor: color,
      accentColor: color,
      visualDensity: _visualDensity,
      toggleableActiveColor: color,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData().copyWith(
        selectedColor: color,
        disabledColor: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: themeData.colorScheme.copyWith(
          primary: color,
          background: color,
        ),
      ),
      pageTransitionsTheme: _pageTransitionsTheme,
      dividerColor: color,
      iconTheme: IconThemeData(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
      ),
    );
  }

  static ThemeData light(MaterialColor color) => _getTheme(color.shade500);

  static ThemeData dark(MaterialColor color) =>
      _getTheme(color.shade800, isDark: true);
}
