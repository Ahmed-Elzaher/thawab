import 'package:get_it/get_it.dart';
import 'package:thawab/features/azkar/data/repositories/azkar_repository.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/features/home/data/repositories/home_repository.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:thawab/features/prayer/data/repositories/prayer_repository.dart';
import 'package:thawab/features/prayer/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:thawab/features/quran/data/repositories/quran_repository.dart';
import 'package:thawab/features/quran/presentation/manager/quran_page_cubit/quran_page_cubit.dart';
import 'package:thawab/features/quran/presentation/manager/surah_cubit/surah_cubit.dart';
import 'package:thawab/features/settings/data/repositories/settings_repository.dart';
import 'package:thawab/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //! ========= Features - Content ==========
  getIt.registerLazySingleton<HomeRepository>(() => EmptyHomeRepository());
  getIt.registerLazySingleton<QuranPageRepository>(
    () => EmptyQuranPageRepository(),
  );
  getIt.registerLazySingleton<SurahRepository>(() => EmptySurahRepository());
  getIt.registerLazySingleton<PrayerRepository>(() => EmptyPrayerRepository());
  getIt.registerLazySingleton<AzkarCategoryRepository>(
    () => EmptyAzkarCategoryRepository(),
  );
  getIt.registerLazySingleton<ZikrSessionRepository>(
    () => EmptyZikrSessionRepository(),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => EmptySettingsRepository(),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(repository: getIt()));
  getIt.registerFactory<QuranPageCubit>(
    () => QuranPageCubit(repository: getIt()),
  );
  getIt.registerFactory<SurahCubit>(() => SurahCubit(repository: getIt()));
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(repository: getIt()));
  getIt.registerFactory<AzkarCategoriesCubit>(
    () => AzkarCategoriesCubit(repository: getIt()),
  );
  getIt.registerFactory<ZikrSessionCubit>(
    () => ZikrSessionCubit(repository: getIt()),
  );
  getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(repository: getIt()),
  );
}
