import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/thawab_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: AppColors.border,
    ),
  );
  runApp(const ThawabApp());
}
