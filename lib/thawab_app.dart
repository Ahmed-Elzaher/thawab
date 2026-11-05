import 'package:flutter/material.dart';
import 'package:thawab/core/theme/app_theme.dart';
import 'package:thawab/core/routing/app_router.dart';

class ThawabApp extends StatelessWidget {
  const ThawabApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'ثواب',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.light,
    routerConfig: AppRouter.router,
    builder: (context, child) => Directionality(
      textDirection: TextDirection.rtl,
      child: child ?? const SizedBox.shrink(),
    ),
  );
}
