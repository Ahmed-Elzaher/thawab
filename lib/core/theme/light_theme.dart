import 'package:flutter/material.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/core/utils/app_constants.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: AppConstants.appFamilyFont,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light(
    primary: AppColors.text,
    onPrimary: AppColors.surface,
    secondary: AppColors.accentGold,
    onSecondary: AppColors.surface,
    tertiary: AppColors.accentGold,
    surfaceContainerHighest: AppColors.quranSurface,
    surface: AppColors.surface,
    onSurface: AppColors.text,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    error: Color(0xFFB3261E),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.border,
    thickness: 1,
    space: 1,
  ),
  navigationBarTheme: NavigationBarThemeData(
    height: 76,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) => TextStyle(
        fontSize: 11,
        color: states.contains(WidgetState.selected)
            ? AppColors.accentGold
            : AppColors.textSecondary,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
  ),
  cardTheme: const CardThemeData(
    elevation: 0,
    color: AppColors.surface,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      side: BorderSide(color: AppColors.border),
    ),
  ),
);
