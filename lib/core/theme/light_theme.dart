import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/core/utils/app_constants.dart';
import 'package:thawab/core/utils/app_spacing.dart';

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
    surfaceContainerLow: AppColors.prayerBackground,
    surface: AppColors.surface,
    onSurface: AppColors.text,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    error: Color(0xFFB3261E),
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.border,
    thickness: 1.h,
    space: 1.h,
  ),
  navigationBarTheme: NavigationBarThemeData(
    height: AppSpacing.navigationBarHeight.h,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) => TextStyle(
        fontSize: 11.sp,
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
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    color: AppColors.surface,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSpacing.cardRadius.r)),
      side: const BorderSide(color: AppColors.border),
    ),
  ),
);
