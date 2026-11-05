import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/home/presentation/widgets/home_feature_tile.dart';
import 'package:thawab/features/home/presentation/widgets/home_reading_progress_card.dart';
import 'package:thawab/features/home/presentation/widgets/home_daily_summary_card.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<HomeCubit>()..fetch(),
    child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final summary = state is HomeSuccess && state.items.isNotEmpty
            ? state.items.first
            : null;
        return AppScreen(
          title: 'ثواب',
          action: IconButton(
            tooltip: 'الإعدادات',
            onPressed: () => context.push(AppRoutes.kSettingsView),
            icon: const Icon(Icons.settings_outlined),
          ),
          bottomNavigationBar: const AppBottomBar(index: 2),
          children: [
            const SizedBox(height: 12),
            HomeDailySummaryCard(summary: summary, state: state),
            const SectionTitle('وِردك اليوم'),
            HomeReadingProgressCard(summary: summary, state: state),
            const SectionTitle('مساحات ثواب'),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.2,
              children: [
                HomeFeatureTile(
                  icon: Icons.menu_book,
                  title: 'المصحف الشريف',
                  subtitle: 'تابع تلاوتك اليومية',
                  onTap: () => context.push(AppRoutes.kQuranReaderView),
                ),
                HomeFeatureTile(
                  icon: Icons.explore_outlined,
                  title: 'مواقيت الصلاة والقبلة',
                  subtitle: 'المواقيت واتجاه القبلة',
                  onTap: () => context.push(AppRoutes.kPrayerView),
                ),
                HomeFeatureTile(
                  icon: Icons.auto_awesome_outlined,
                  title: 'الأذكار والمسبحة',
                  subtitle: 'أوراد الذكر والعدّاد',
                  onTap: () => context.push(AppRoutes.kAzkarView),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
}
