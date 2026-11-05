import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:thawab/core/services/app_preferences_controller.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/features/settings/presentation/widgets/settings_tile.dart';
import 'package:thawab/features/settings/presentation/widgets/license_disclosure.dart';
import 'package:thawab/features/settings/domain/entities/settings_entity.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, this.settings});

  final SettingsEntity? settings;

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<SettingsCubit, SettingsState>(
    builder: (context, state) {
      final strings = S.of(context);
      final loadedSettings = state is SettingsSuccess && state.items.isNotEmpty
          ? state.items.first
          : settings;
      return AppScreen(
        title: strings.settings,
        bottomNavigationBar: const AppBottomBar(
          index: AppNavigationIndex.settings,
        ),
        children: [
          if (loadedSettings == null)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is SettingsLoading || state is SettingsInitial,
                errorMessage: state is SettingsFailure ? state.message : null,
                emptyMessage: strings.settingsEmpty,
              ),
            ),
          SectionTitle(strings.preferences),
          FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: Text(strings.language),
                  trailing: DropdownButton<Locale>(
                    value: getIt<AppPreferencesController>().locale,
                    underline: const SizedBox.shrink(),
                    items: [
                      DropdownMenuItem(
                        value: const Locale('ar'),
                        child: Text(strings.arabic),
                      ),
                      DropdownMenuItem(
                        value: const Locale('en'),
                        child: Text(strings.english),
                      ),
                    ],
                    onChanged: (locale) {
                      if (locale != null) {
                        getIt<AppPreferencesController>().setLocale(locale);
                      }
                    },
                  ),
                ),
                Divider(height: 1.h),
                Builder(
                  builder: (context) {
                    final preferences = getIt<AppPreferencesController>();
                    final isDark = preferences.themeMode == ThemeMode.dark;
                    return SwitchListTile(
                      secondary: Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      title: Text(
                        isDark ? strings.themeMode : strings.lightMode,
                      ),
                      value: isDark,
                      onChanged: (enabled) => preferences.setThemeMode(
                        enabled ? ThemeMode.dark : ThemeMode.light,
                      ),
                    );
                  },
                ),
                Divider(height: 1.h),
                SettingsTile(
                  icon: Icons.text_fields,
                  title: strings.quranFontSize,
                  subtitle: loadedSettings?.quranFontSize,
                ),
              ],
            ),
          ),
          SectionTitle(strings.prayerAndAdhan),
          FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.location_on_outlined,
                  title: strings.location,
                  subtitle: loadedSettings?.location,
                ),
                Divider(height: 1.h),
                SettingsTile(
                  icon: Icons.access_time,
                  title: strings.calculationMethod,
                  subtitle: loadedSettings?.prayerCalculationMethod,
                ),
              ],
            ),
          ),
          SectionTitle(strings.alerts),
          FlatCard(
            padding: EdgeInsets.zero,
            child: SettingsTile(
              icon: Icons.notifications_outlined,
              title: strings.notifications,
              subtitle: loadedSettings?.notifications,
            ),
          ),
          SectionTitle(strings.aboutLicense),
          FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.info_outline,
                  title: strings.aboutApp,
                ),
                Divider(height: 1.h),
                LicenseDisclosure(
                  title: strings.tanzilLicenseTitle,
                  subtitle: strings.tanzilLicenseSubtitle,
                  sourceUrl: 'https://tanzil.net',
                  licenseAssetPath: 'assets/tanzil-license.txt',
                ),
                LicenseDisclosure(
                  title: strings.tanzilMetadataLicenseTitle,
                  subtitle: strings.tanzilMetadataLicenseSubtitle,
                  sourceUrl: 'https://tanzil.net/docs/Quran_Metadata',
                  licenseAssetPath: 'assets/tanzil-metadata-license.txt',
                ),
                LicenseDisclosure(
                  title: strings.hisnLicenseTitle,
                  subtitle: strings.hisnLicenseSubtitle,
                  sourceUrl: 'https://github.com/asellam/HisnElMuslim',
                  licenseAssetPath: 'assets/hisn-al-muslim-license.md',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              strings.appName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      );
    },
  );
}
