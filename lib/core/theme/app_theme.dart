import 'package:flutter/material.dart';
import 'package:thawab/core/theme/dark_theme.dart' as dark_theme;
import 'package:thawab/core/theme/light_theme.dart' as light_theme;

abstract class AppTheme {
  static ThemeData get lightTheme => light_theme.lightTheme;

  static ThemeData get darkTheme => dark_theme.darkTheme;
}
