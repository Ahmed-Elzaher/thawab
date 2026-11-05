import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/core/utils/app_spacing.dart';
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
        final strings = S.of(context);
        final summary = state is HomeSuccess && state.items.isNotEmpty
            ? state.items.first
            : null;
        return AppScreen(
          title: strings.appName,
          action: IconButton(
            tooltip: strings.settings,
            onPressed: () => context.push(AppRoutes.kSettingsView),
            icon: const Icon(Icons.settings_outlined),
          ),
          bottomNavigationBar: const AppBottomBar(
            index: AppNavigationIndex.home,
          ),
          children: [
            SizedBox(height: 12.h),
            HomeDailySummaryCard(summary: summary, state: state),
            SectionTitle(strings.homeTodayWord),
            HomeReadingProgressCard(summary: summary, state: state),
            SectionTitle(strings.homeSpaces),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: _gridColumnCount(context),
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 1.2,
              children: [
                HomeFeatureTile(
                  icon: Icons.menu_book,
                  title: strings.quranCardTitle,
                  subtitle: strings.quranCardSubtitle,
                  onTap: () => context.push(AppRoutes.kQuranReaderView),
                ),
                HomeFeatureTile(
                  icon: Icons.explore_outlined,
                  title: strings.prayerCardTitle,
                  subtitle: strings.prayerCardSubtitle,
                  onTap: () => context.push(AppRoutes.kPrayerView),
                ),
                HomeFeatureTile(
                  icon: Icons.auto_awesome_outlined,
                  title: strings.azkarCardTitle,
                  subtitle: strings.azkarCardSubtitle,
                  onTap: () => context.push(AppRoutes.kAzkarView),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  int _gridColumnCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= AppSpacing.expandedBreakpoint) return 4;
    if (width >= AppSpacing.tabletBreakpoint) return 3;
    return 2;
  }
}
