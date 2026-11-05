import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (destination) => context.go(switch (destination) {
        AppNavigationIndex.quran => AppRoutes.kQuranReaderView,
        AppNavigationIndex.prayer => AppRoutes.kPrayerView,
        AppNavigationIndex.home => AppRoutes.kHomeView,
        AppNavigationIndex.azkar => AppRoutes.kAzkarView,
        _ => AppRoutes.kSettingsView,
      }),
      backgroundColor: Theme.of(context).colorScheme.surface,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.menu_book_outlined),
          selectedIcon: const Icon(Icons.menu_book),
          label: strings.quran,
        ),
        NavigationDestination(
          icon: const Icon(Icons.access_time),
          label: strings.prayer,
        ),
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: strings.home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.auto_awesome_outlined),
          selectedIcon: const Icon(Icons.auto_awesome),
          label: strings.azkar,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: strings.settings,
        ),
      ],
    );
  }
}
