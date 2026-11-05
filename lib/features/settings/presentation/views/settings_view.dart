import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/features/settings/presentation/widgets/settings_tile.dart';
import 'package:thawab/features/settings/data/models/settings_model.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, this.settings});

  final SettingsModel? settings;

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<SettingsCubit, SettingsState>(
    builder: (context, state) {
      final loadedSettings = state is SettingsSuccess && state.items.isNotEmpty
          ? state.items.first
          : settings;
      return AppScreen(
        title: 'الإعدادات',
        bottomNavigationBar: const AppBottomBar(index: 4),
        backgroundColor: AppColors.prayerBackground,
        children: [
          if (loadedSettings == null)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is SettingsLoading || state is SettingsInitial,
                errorMessage: state is SettingsFailure ? state.message : null,
                emptyMessage: 'ستظهر التفضيلات بعد تحميلها.',
              ),
            ),
          const SectionTitle('التفضيلات'),
          FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.palette_outlined,
                  title: 'المظهر',
                  subtitle: loadedSettings?.appearance,
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.text_fields,
                  title: 'حجم خط المصحف',
                  subtitle: loadedSettings?.quranFontSize,
                ),
              ],
            ),
          ),
          const SectionTitle('مواقيت الصلاة والأذان'),
          FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.location_on_outlined,
                  title: 'الموقع',
                  subtitle: loadedSettings?.location,
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.access_time,
                  title: 'طريقة حساب الصلاة',
                  subtitle: loadedSettings?.prayerCalculationMethod,
                ),
              ],
            ),
          ),
          const SectionTitle('الإشعارات والتنبيهات'),
          FlatCard(
            padding: EdgeInsets.zero,
            child: SettingsTile(
              icon: Icons.notifications_outlined,
              title: 'التنبيهات',
              subtitle: loadedSettings?.notifications,
            ),
          ),
          const SectionTitle('حول التطبيق والترخيص'),
          const FlatCard(
            padding: EdgeInsets.zero,
            child: SettingsTile(icon: Icons.info_outline, title: 'عن التطبيق'),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'ثواب',
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
