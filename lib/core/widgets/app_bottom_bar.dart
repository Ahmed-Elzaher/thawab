import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => NavigationBar(
    selectedIndex: index,
    onDestinationSelected: (destination) => context.go(switch (destination) {
      0 => AppRoutes.kQuranReaderView,
      1 => AppRoutes.kPrayerView,
      2 => AppRoutes.kHomeView,
      3 => AppRoutes.kAzkarView,
      _ => AppRoutes.kSettingsView,
    }),
    backgroundColor: Theme.of(context).colorScheme.surface,
    indicatorColor: Theme.of(context).colorScheme.secondary,
    elevation: 0,
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.menu_book_outlined),
        selectedIcon: Icon(Icons.menu_book),
        label: 'المصحف',
      ),
      NavigationDestination(icon: Icon(Icons.access_time), label: 'الصلاة'),
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'الرئيسية',
      ),
      NavigationDestination(
        icon: Icon(Icons.auto_awesome_outlined),
        selectedIcon: Icon(Icons.auto_awesome),
        label: 'الأذكار',
      ),
      NavigationDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: 'الإعدادات',
      ),
    ],
  );
}
