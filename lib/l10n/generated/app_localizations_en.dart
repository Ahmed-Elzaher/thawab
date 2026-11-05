// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Thawab';

  @override
  String get appTagline => 'A companion for the Quran and good deeds';

  @override
  String get splashLoading => 'Preparing your Quran...';

  @override
  String get splashVerse => 'And recite the Quran with measured recitation.';

  @override
  String get appVersion => 'Version 1.0';

  @override
  String get quran => 'Quran';

  @override
  String get prayer => 'Prayer';

  @override
  String get home => 'Home';

  @override
  String get azkar => 'Azkar';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get themeMode => 'Dark mode';

  @override
  String get lightMode => 'Light mode';

  @override
  String get quranReaderTitle => 'The Holy Quran';

  @override
  String get quranIndexTitle => 'Surah index';

  @override
  String get surahSearchHint => 'Search surahs or verses...';

  @override
  String get quranSurahs => 'Quran surahs';

  @override
  String surahCount(int count) {
    return '$count surahs';
  }

  @override
  String verseCount(int count) {
    return '$count verses';
  }

  @override
  String azkarEntryCount(int count) {
    return '$count supplications';
  }

  @override
  String get quranSurahsUnavailable =>
      'Surahs will appear when Quran data is available.';

  @override
  String get surahIndexTooltip => 'Surah index';

  @override
  String get versesUnavailable =>
      'Verses will appear here when Quran data is available.';

  @override
  String get readingTools => 'Reading tools';

  @override
  String get readingToolsUnavailable =>
      'Reading tools will be available when page data is loaded.';

  @override
  String get browseSurahs => 'Browse surah index';

  @override
  String quranPageIndicator(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String get previousPage => 'Previous page';

  @override
  String get nextPage => 'Next page';

  @override
  String get azkarTitle => 'Azkar and tasbeeh';

  @override
  String get azkarCategories => 'Azkar categories';

  @override
  String get electronicTasbeeh => 'Digital tasbeeh';

  @override
  String get yourTasbeeh => 'Your tasbeeh';

  @override
  String get loadZikrToStart => 'Load a zikr to begin';

  @override
  String get counter => 'Counter';

  @override
  String countOf(int target) {
    return 'of $target';
  }

  @override
  String get resetCounter => 'Reset counter';

  @override
  String get viewAll => 'View all';

  @override
  String get azkarUnavailable => 'Azkar categories will appear when available.';

  @override
  String get azkarSearchHint => 'Search azkar and supplications...';

  @override
  String get mainCategories => 'Main categories';

  @override
  String get azkarSearchEmpty => 'No categories match your search.';

  @override
  String get prayerTitle => 'Prayer times';

  @override
  String get locationUnavailable => 'Location unavailable';

  @override
  String get nextPrayer => 'Next prayer';

  @override
  String get prayerDurationUnavailable =>
      'The remaining time will appear when prayer times load.';

  @override
  String get todayPrayers => 'Today’s prayers';

  @override
  String get prayerTimesUnavailable =>
      'Prayer times will appear when a data source is connected.';

  @override
  String get qiblaDirection => 'Qibla direction';

  @override
  String get homeTodayWord => 'Your daily reading';

  @override
  String get homeSpaces => 'Thawab spaces';

  @override
  String get homeDailyUnavailable =>
      'Today’s summary will appear when available.';

  @override
  String get readingProgressUnavailable =>
      'Reading progress will appear when available.';

  @override
  String get continueReading => 'Continue reading';

  @override
  String get quranCardTitle => 'The Holy Quran';

  @override
  String get quranCardSubtitle => 'Continue your daily recitation';

  @override
  String get prayerCardTitle => 'Prayer times and Qibla';

  @override
  String get prayerCardSubtitle => 'Prayer times and Qibla direction';

  @override
  String get azkarCardTitle => 'Azkar and tasbeeh';

  @override
  String get azkarCardSubtitle => 'Daily azkar and counter';

  @override
  String get settingsEmpty => 'Preferences will appear when available.';

  @override
  String get preferences => 'Preferences';

  @override
  String get appearance => 'Appearance';

  @override
  String get quranFontSize => 'Quran font size';

  @override
  String get prayerAndAdhan => 'Prayer times and adhan';

  @override
  String get location => 'Location';

  @override
  String get calculationMethod => 'Prayer calculation method';

  @override
  String get alerts => 'Notifications and alerts';

  @override
  String get notifications => 'Notifications';

  @override
  String get aboutLicense => 'About and licenses';

  @override
  String get aboutApp => 'About the app';

  @override
  String get tanzilLicenseTitle => 'Tanzil Quran Text';

  @override
  String get tanzilLicenseSubtitle =>
      'Uthmani v1.1 · CC BY 3.0 · © 2007–2024 Tanzil Project';

  @override
  String get tanzilMetadataLicenseTitle => 'Tanzil Quran metadata';

  @override
  String get tanzilMetadataLicenseSubtitle => 'CC BY · © 2008–2009 Tanzil.info';

  @override
  String get hisnLicenseTitle => 'Hisn al-Muslim adhkar';

  @override
  String get hisnLicenseSubtitle => 'MIT License · © 2021 Abdellah SELLAM';

  @override
  String get homePrayerLabel => 'Next prayer';

  @override
  String get dataSourceUnavailable => 'The data source is not connected yet';

  @override
  String get routeError => 'This screen could not be opened.';
}
