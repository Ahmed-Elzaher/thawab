import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Thawab'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'A companion for the Quran and good deeds'**
  String get appTagline;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Preparing your Quran...'**
  String get splashLoading;

  /// No description provided for @splashVerse.
  ///
  /// In en, this message translates to:
  /// **'And recite the Quran with measured recitation.'**
  String get splashVerse;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0'**
  String get appVersion;

  /// No description provided for @quran.
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get quran;

  /// No description provided for @prayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayer;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @azkar.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get azkar;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get themeMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get lightMode;

  /// No description provided for @quranReaderTitle.
  ///
  /// In en, this message translates to:
  /// **'The Holy Quran'**
  String get quranReaderTitle;

  /// No description provided for @quranIndexTitle.
  ///
  /// In en, this message translates to:
  /// **'Surah index'**
  String get quranIndexTitle;

  /// No description provided for @surahSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search surahs or verses...'**
  String get surahSearchHint;

  /// No description provided for @quranSurahs.
  ///
  /// In en, this message translates to:
  /// **'Quran surahs'**
  String get quranSurahs;

  /// No description provided for @meccan.
  ///
  /// In en, this message translates to:
  /// **'Meccan'**
  String get meccan;

  /// No description provided for @medinan.
  ///
  /// In en, this message translates to:
  /// **'Medinan'**
  String get medinan;

  /// No description provided for @surahCount.
  ///
  /// In en, this message translates to:
  /// **'{count} surahs'**
  String surahCount(int count);

  /// No description provided for @verseCount.
  ///
  /// In en, this message translates to:
  /// **'{count} verses'**
  String verseCount(int count);

  /// No description provided for @azkarEntryCount.
  ///
  /// In en, this message translates to:
  /// **'{count} supplications'**
  String azkarEntryCount(int count);

  /// No description provided for @quranSurahsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Surahs will appear when Quran data is available.'**
  String get quranSurahsUnavailable;

  /// No description provided for @surahIndexTooltip.
  ///
  /// In en, this message translates to:
  /// **'Surah index'**
  String get surahIndexTooltip;

  /// No description provided for @versesUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Verses will appear here when Quran data is available.'**
  String get versesUnavailable;

  /// No description provided for @readingTools.
  ///
  /// In en, this message translates to:
  /// **'Reading tools'**
  String get readingTools;

  /// No description provided for @readingToolsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Reading tools will be available when page data is loaded.'**
  String get readingToolsUnavailable;

  /// No description provided for @browseSurahs.
  ///
  /// In en, this message translates to:
  /// **'Browse surah index'**
  String get browseSurahs;

  /// No description provided for @quranPageIndicator.
  ///
  /// In en, this message translates to:
  /// **'Page {current} of {total}'**
  String quranPageIndicator(int current, int total);

  /// No description provided for @previousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get nextPage;

  /// No description provided for @azkarTitle.
  ///
  /// In en, this message translates to:
  /// **'Azkar and tasbeeh'**
  String get azkarTitle;

  /// No description provided for @azkarCategories.
  ///
  /// In en, this message translates to:
  /// **'Azkar categories'**
  String get azkarCategories;

  /// No description provided for @electronicTasbeeh.
  ///
  /// In en, this message translates to:
  /// **'Digital tasbeeh'**
  String get electronicTasbeeh;

  /// No description provided for @yourTasbeeh.
  ///
  /// In en, this message translates to:
  /// **'Your tasbeeh'**
  String get yourTasbeeh;

  /// No description provided for @loadZikrToStart.
  ///
  /// In en, this message translates to:
  /// **'Load a zikr to begin'**
  String get loadZikrToStart;

  /// No description provided for @counter.
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counter;

  /// No description provided for @countOf.
  ///
  /// In en, this message translates to:
  /// **'of {target}'**
  String countOf(int target);

  /// No description provided for @resetCounter.
  ///
  /// In en, this message translates to:
  /// **'Reset counter'**
  String get resetCounter;

  /// No description provided for @nextZikr.
  ///
  /// In en, this message translates to:
  /// **'Next zikr'**
  String get nextZikr;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @azkarUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Azkar categories will appear when available.'**
  String get azkarUnavailable;

  /// No description provided for @azkarSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search azkar and supplications...'**
  String get azkarSearchHint;

  /// No description provided for @mainCategories.
  ///
  /// In en, this message translates to:
  /// **'Main categories'**
  String get mainCategories;

  /// No description provided for @azkarSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No categories match your search.'**
  String get azkarSearchEmpty;

  /// No description provided for @prayerTitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer times'**
  String get prayerTitle;

  /// No description provided for @refreshPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Refresh prayer times'**
  String get refreshPrayerTimes;

  /// No description provided for @locationUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Location unavailable'**
  String get locationUnavailable;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'Next prayer'**
  String get nextPrayer;

  /// No description provided for @prayerDurationUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The remaining time will appear when prayer times load.'**
  String get prayerDurationUnavailable;

  /// No description provided for @todayPrayers.
  ///
  /// In en, this message translates to:
  /// **'Today’s prayers'**
  String get todayPrayers;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @sunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sunrise;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// No description provided for @prayerTimesUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Enable location and internet access to load prayer times and Qibla direction.'**
  String get prayerTimesUnavailable;

  /// No description provided for @qiblaDirection.
  ///
  /// In en, this message translates to:
  /// **'Qibla direction'**
  String get qiblaDirection;

  /// No description provided for @homeTodayWord.
  ///
  /// In en, this message translates to:
  /// **'Your daily reading'**
  String get homeTodayWord;

  /// No description provided for @homeSpaces.
  ///
  /// In en, this message translates to:
  /// **'Thawab spaces'**
  String get homeSpaces;

  /// No description provided for @homeDailyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Enable location and internet access to load today’s summary.'**
  String get homeDailyUnavailable;

  /// No description provided for @readingProgressUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Reading progress will appear when available.'**
  String get readingProgressUnavailable;

  /// No description provided for @continueReading.
  ///
  /// In en, this message translates to:
  /// **'Continue reading'**
  String get continueReading;

  /// No description provided for @quranCardTitle.
  ///
  /// In en, this message translates to:
  /// **'The Holy Quran'**
  String get quranCardTitle;

  /// No description provided for @quranCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Continue your daily recitation'**
  String get quranCardSubtitle;

  /// No description provided for @prayerCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer times and Qibla'**
  String get prayerCardTitle;

  /// No description provided for @prayerCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer times and Qibla direction'**
  String get prayerCardSubtitle;

  /// No description provided for @azkarCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Azkar and tasbeeh'**
  String get azkarCardTitle;

  /// No description provided for @azkarCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Daily azkar and counter'**
  String get azkarCardSubtitle;

  /// No description provided for @settingsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Preferences will appear when available.'**
  String get settingsEmpty;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @quranFontSize.
  ///
  /// In en, this message translates to:
  /// **'Quran font size'**
  String get quranFontSize;

  /// No description provided for @prayerAndAdhan.
  ///
  /// In en, this message translates to:
  /// **'Prayer times and adhan'**
  String get prayerAndAdhan;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @calculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Prayer calculation method'**
  String get calculationMethod;

  /// No description provided for @alerts.
  ///
  /// In en, this message translates to:
  /// **'Notifications and alerts'**
  String get alerts;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @aboutLicense.
  ///
  /// In en, this message translates to:
  /// **'About and licenses'**
  String get aboutLicense;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get aboutApp;

  /// No description provided for @tanzilLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Tanzil Quran Text'**
  String get tanzilLicenseTitle;

  /// No description provided for @tanzilLicenseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Uthmani v1.1 · CC BY 3.0 · © 2007–2024 Tanzil Project'**
  String get tanzilLicenseSubtitle;

  /// No description provided for @tanzilMetadataLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Tanzil Quran metadata'**
  String get tanzilMetadataLicenseTitle;

  /// No description provided for @tanzilMetadataLicenseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'CC BY · © 2008–2009 Tanzil.info'**
  String get tanzilMetadataLicenseSubtitle;

  /// No description provided for @hisnLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Hisn al-Muslim adhkar'**
  String get hisnLicenseTitle;

  /// No description provided for @hisnLicenseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'MIT License · © 2021 Abdellah SELLAM'**
  String get hisnLicenseSubtitle;

  /// No description provided for @homePrayerLabel.
  ///
  /// In en, this message translates to:
  /// **'Next prayer'**
  String get homePrayerLabel;

  /// No description provided for @dataSourceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The data source is not connected yet'**
  String get dataSourceUnavailable;

  /// No description provided for @routeError.
  ///
  /// In en, this message translates to:
  /// **'This screen could not be opened.'**
  String get routeError;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
