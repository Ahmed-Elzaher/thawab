import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/theme/app_theme.dart';
import 'package:thawab/core/routing/app_router.dart';
import 'package:thawab/core/services/app_preferences_controller.dart';
import 'package:thawab/core/services/services_locator.dart';

class ThawabApp extends StatelessWidget {
  const ThawabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = getIt<AppPreferencesController>();
    return ListenableBuilder(
      listenable: preferences,
      builder: (context, _) => MaterialApp.router(
        onGenerateTitle: (context) => S.of(context).appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: preferences.themeMode,
        locale: preferences.locale,
        supportedLocales: S.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: AppRouter.router,
      ),
    );
  }
}
