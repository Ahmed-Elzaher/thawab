import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/core/utils/app_constants.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: AppConstants.appFamilyFont,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD97706),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFCBD5E1),
    onSecondary: Color(0xFF0F172A),
    tertiary: Color(0xFFD97706),
    surface: Color(0xFF1E293B),
    onSurface: Color(0xFFF8FAFC),
    onSurfaceVariant: Color(0xFFCBD5E1),
    outline: Color(0xFF475569),
    error: Color(0xFFF2B8B5),
  ),
  scaffoldBackgroundColor: const Color(0xFF0F172A),
  dividerTheme: DividerThemeData(
    color: Color(0xFF475569),
    thickness: 1.h,
    space: 1.h,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFF0F172A),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFF0F172A),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    color: Color(0xFF1E293B),
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      side: const BorderSide(color: Color(0xFF475569)),
    ),
  ),
);
