import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:thawab/core/networking/api_consumer.dart';
import 'package:thawab/core/networking/api_end_points.dart';
import 'package:thawab/core/networking/dio_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thawab/core/services/app_preferences_controller.dart';
import 'package:thawab/features/azkar/data/data_sources/azkar_data_source.dart';
import 'package:thawab/features/azkar/data/repositories/azkar_repository_impl.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/features/azkar/domain/repositories/azkar_repository.dart';
import 'package:thawab/features/home/data/data_sources/home_data_source.dart';
import 'package:thawab/features/home/data/repositories/home_repository_impl.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:thawab/features/home/domain/repositories/home_repository.dart';
import 'package:thawab/features/quran/data/data_sources/quran_reading_progress_data_source.dart';
import 'package:thawab/features/quran/data/repositories/quran_reading_progress_repository_impl.dart';
import 'package:thawab/features/quran/domain/repositories/quran_reading_progress_repository.dart';
import 'package:thawab/features/prayer/data/data_sources/prayer_data_source.dart';
import 'package:thawab/features/prayer/data/data_sources/device_location_data_source.dart';
import 'package:thawab/features/prayer/data/repositories/prayer_repository_impl.dart';
import 'package:thawab/features/prayer/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:thawab/features/prayer/domain/repositories/prayer_repository.dart';
import 'package:thawab/features/quran/data/data_sources/quran_data_source.dart';
import 'package:thawab/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:thawab/features/quran/presentation/manager/quran_page_cubit/quran_page_cubit.dart';
import 'package:thawab/features/quran/presentation/manager/surah_cubit/surah_cubit.dart';
import 'package:thawab/features/quran/domain/repositories/quran_repository.dart';
import 'package:thawab/features/settings/data/data_sources/settings_data_source.dart';
import 'package:thawab/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:thawab/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:thawab/features/settings/domain/repositories/settings_repository.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final preferences = await SharedPreferences.getInstance();
  final appPreferences = AppPreferencesController(preferences);
  await appPreferences.load();
  getIt.registerSingleton<AppPreferencesController>(appPreferences);

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: EndPoint.alAdhanBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    ),
  );
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));

  //! ========= Features - Content ==========
  getIt.registerLazySingleton<HomeDataSource>(
    () => PrayerHomeDataSource(
      prayerRepository: getIt(),
      readingProgressRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<QuranDataSource>(() => LocalQuranDataSource());
  getIt.registerLazySingleton<QuranPageRepository>(
    () => QuranPageRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<SurahRepository>(
    () => SurahRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<QuranReadingProgressDataSource>(
    () => SharedPreferencesQuranReadingProgressDataSource(
      preferences: preferences,
    ),
  );
  getIt.registerLazySingleton<QuranReadingProgressRepository>(
    () => QuranReadingProgressRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<DeviceLocationDataSource>(
    () => GeolocatorDataSource(),
  );
  getIt.registerLazySingleton<PrayerDataSource>(
    () => AlAdhanPrayerDataSource(
      apiConsumer: getIt(),
      locationDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<PrayerRepository>(
    () => PrayerRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<AzkarDataSource>(() => LocalAzkarDataSource());
  getIt.registerLazySingleton<AzkarCategoryRepository>(
    () => AzkarCategoryRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<ZikrSessionRepository>(
    () => ZikrSessionRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerLazySingleton<SettingsDataSource>(
    () => EmptySettingsDataSource(),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(dataSource: getIt()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(repository: getIt()));
  getIt.registerFactory<QuranPageCubit>(
    () =>
        QuranPageCubit(repository: getIt(), readingProgressRepository: getIt()),
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
