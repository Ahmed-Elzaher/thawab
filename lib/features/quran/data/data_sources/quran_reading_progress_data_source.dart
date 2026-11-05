import 'package:shared_preferences/shared_preferences.dart';
import 'package:thawab/features/quran/domain/entities/quran_reading_progress_entity.dart';

abstract class QuranReadingProgressDataSource {
  Future<QuranReadingProgressEntity?> fetch();
  Future<void> save(QuranReadingProgressEntity progress);
}

class SharedPreferencesQuranReadingProgressDataSource
    implements QuranReadingProgressDataSource {
  const SharedPreferencesQuranReadingProgressDataSource({
    required this.preferences,
  });

  static const String _pageNumberKey = 'quran_reading_page_number';
  static const String _surahNameKey = 'quran_reading_surah_name';

  final SharedPreferences preferences;

  @override
  Future<QuranReadingProgressEntity?> fetch() async {
    final pageNumber = preferences.getInt(_pageNumberKey);
    final surahName = preferences.getString(_surahNameKey);
    if (pageNumber == null || surahName == null) return null;

    return QuranReadingProgressEntity(
      pageNumber: pageNumber,
      surahName: surahName,
    );
  }

  @override
  Future<void> save(QuranReadingProgressEntity progress) async {
    await preferences.setInt(_pageNumberKey, progress.pageNumber);
    await preferences.setString(_surahNameKey, progress.surahName);
  }
}
