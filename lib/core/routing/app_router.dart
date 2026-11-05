import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/presentation/views/azkar_categories_view.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/views/azkar_view.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/features/home/presentation/views/home_view.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';
import 'package:thawab/features/quran/presentation/views/quran_index_view.dart';
import 'package:thawab/features/quran/presentation/views/quran_reader_view.dart';
import 'package:thawab/features/quran/presentation/manager/quran_page_cubit/quran_page_cubit.dart';
import 'package:thawab/features/quran/presentation/manager/surah_cubit/surah_cubit.dart';
import 'package:thawab/features/settings/presentation/views/settings_view.dart';
import 'package:thawab/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:thawab/features/prayer/presentation/views/prayer_view.dart';
import 'package:thawab/features/prayer/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:thawab/features/splash/presentation/views/splash_view.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kSplashView,
        builder: (_, _) => const SplashView(),
      ),
      GoRoute(path: AppRoutes.kHomeView, builder: (_, _) => const HomeView()),
      GoRoute(
        path: AppRoutes.kQuranReaderView,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<QuranPageCubit>()..fetch(),
          child: QuranReaderView(
            onOpenIndex: () => context.push(AppRoutes.kQuranIndexView),
            surah: state.extra is SurahEntity
                ? state.extra! as SurahEntity
                : null,
            initialPageNumber: state.extra is int ? state.extra! as int : null,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.kPrayerView,
        builder: (_, _) => BlocProvider(
          create: (_) => getIt<PrayerCubit>()..fetch(),
          child: const PrayerView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAzkarView,
        builder: (_, _) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<AzkarCategoriesCubit>()..fetch()),
            BlocProvider(create: (_) => getIt<ZikrSessionCubit>()..fetch()),
          ],
          child: const AzkarView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kQuranIndexView,
        builder: (_, state) => BlocProvider(
          create: (_) => getIt<SurahCubit>()..fetch(),
          child: QuranIndexView(
            surahs: state.extra is List<SurahEntity>
                ? state.extra! as List<SurahEntity>
                : const [],
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAzkarCategoriesView,
        builder: (_, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<AzkarCategoriesCubit>()..fetch()),
            BlocProvider(create: (_) => getIt<ZikrSessionCubit>()..fetch()),
          ],
          child: AzkarCategoriesView(
            categories: state.extra is List<AzkarCategoryEntity>
                ? state.extra! as List<AzkarCategoryEntity>
                : const [],
            selectedCategory: state.extra is AzkarCategoryEntity
                ? state.extra! as AzkarCategoryEntity
                : null,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.kSettingsView,
        builder: (_, _) => BlocProvider(
          create: (_) => getIt<SettingsCubit>()..fetch(),
          child: const SettingsView(),
        ),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(S.of(context).routeError))),
  );
}
