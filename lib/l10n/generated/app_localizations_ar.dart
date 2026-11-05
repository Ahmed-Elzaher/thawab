// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'ثواب';

  @override
  String get appTagline => 'رِفْقَةُ القُرْآنِ وَالأَثَرِ الطَّيِّب';

  @override
  String get splashLoading => 'جاري تجهيز المصحف...';

  @override
  String get splashVerse => '«وَرَتِّلِ الْقُرْآنَ تَرْتِيلًا»';

  @override
  String get appVersion => 'الإصدار 1.0';

  @override
  String get quran => 'المصحف';

  @override
  String get prayer => 'الصلاة';

  @override
  String get home => 'الرئيسية';

  @override
  String get azkar => 'الأذكار';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get themeMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get quranReaderTitle => 'المصحف الشريف';

  @override
  String get quranIndexTitle => 'فهرس السور';

  @override
  String get surahSearchHint => 'ابحث عن سورة أو آية...';

  @override
  String get quranSurahs => 'سور القرآن الكريم';

  @override
  String get meccan => 'مكية';

  @override
  String get medinan => 'مدنية';

  @override
  String surahCount(int count) {
    return '$count سورة';
  }

  @override
  String verseCount(int count) {
    return '$count آية';
  }

  @override
  String azkarEntryCount(int count) {
    return '$count ذكرًا';
  }

  @override
  String get quranSurahsUnavailable => 'ستظهر السور بعد تحميل بيانات المصحف.';

  @override
  String get surahIndexTooltip => 'فهرس السور';

  @override
  String get versesUnavailable => 'ستظهر الآيات هنا بعد تحميل بيانات المصحف.';

  @override
  String get readingTools => 'أدوات القراءة';

  @override
  String get readingToolsUnavailable =>
      'تتوفر أدوات القراءة بعد تحميل بيانات الصفحة.';

  @override
  String get browseSurahs => 'تصفح فهرس السور';

  @override
  String quranPageIndicator(int current, int total) {
    return 'الصفحة $current من $total';
  }

  @override
  String get previousPage => 'الصفحة السابقة';

  @override
  String get nextPage => 'الصفحة التالية';

  @override
  String get azkarTitle => 'الأذكار والمسبحة';

  @override
  String get azkarCategories => 'أقسام الأذكار';

  @override
  String get electronicTasbeeh => 'المسبحة الإلكترونية';

  @override
  String get yourTasbeeh => 'مسبحتك';

  @override
  String get loadZikrToStart => 'حمّل ذِكرًا للبدء';

  @override
  String get counter => 'العداد';

  @override
  String countOf(int target) {
    return 'من أصل $target';
  }

  @override
  String get resetCounter => 'إعادة العداد';

  @override
  String get nextZikr => 'الذكر التالي';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get azkarUnavailable => 'ستظهر أقسام الأذكار بعد تحميلها.';

  @override
  String get azkarSearchHint => 'ابحث في الأذكار والأدعية...';

  @override
  String get mainCategories => 'الأقسام الرئيسية';

  @override
  String get azkarSearchEmpty => 'لا توجد أقسام مطابقة للبحث.';

  @override
  String get prayerTitle => 'مواقيت الصلاة';

  @override
  String get refreshPrayerTimes => 'تحديث المواقيت';

  @override
  String get locationUnavailable => 'الموقع غير متاح';

  @override
  String get nextPrayer => 'الصلاة القادمة';

  @override
  String get prayerDurationUnavailable => 'ستظهر المدة بعد تحميل المواقيت.';

  @override
  String get todayPrayers => 'مواقيت اليوم';

  @override
  String get fajr => 'الفجر';

  @override
  String get sunrise => 'الشروق';

  @override
  String get dhuhr => 'الظهر';

  @override
  String get asr => 'العصر';

  @override
  String get maghrib => 'المغرب';

  @override
  String get isha => 'العشاء';

  @override
  String get prayerTimesUnavailable =>
      'فعّل الموقع والإنترنت لتحميل مواقيت الصلاة واتجاه القبلة.';

  @override
  String get qiblaDirection => 'اتجاه القبلة';

  @override
  String get homeTodayWord => 'وِردك اليوم';

  @override
  String get homeSpaces => 'مساحات ثواب';

  @override
  String get homeDailyUnavailable => 'فعّل الموقع والإنترنت لعرض ملخص اليوم.';

  @override
  String get readingProgressUnavailable => 'سيظهر تقدم القراءة بعد تحميله.';

  @override
  String get continueReading => 'أكمل القراءة';

  @override
  String get quranCardTitle => 'المصحف الشريف';

  @override
  String get quranCardSubtitle => 'تابع تلاوتك اليومية';

  @override
  String get prayerCardTitle => 'مواقيت الصلاة والقبلة';

  @override
  String get prayerCardSubtitle => 'المواقيت واتجاه القبلة';

  @override
  String get azkarCardTitle => 'الأذكار والمسبحة';

  @override
  String get azkarCardSubtitle => 'أوراد الذكر والعدّاد';

  @override
  String get settingsEmpty => 'ستظهر التفضيلات بعد تحميلها.';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get appearance => 'المظهر';

  @override
  String get quranFontSize => 'حجم خط المصحف';

  @override
  String get prayerAndAdhan => 'مواقيت الصلاة والأذان';

  @override
  String get location => 'الموقع';

  @override
  String get calculationMethod => 'طريقة حساب الصلاة';

  @override
  String get alerts => 'الإشعارات والتنبيهات';

  @override
  String get notifications => 'التنبيهات';

  @override
  String get aboutLicense => 'حول التطبيق والترخيص';

  @override
  String get aboutApp => 'عن التطبيق';

  @override
  String get tanzilLicenseTitle => 'نص القرآن من مشروع تنزيل';

  @override
  String get tanzilLicenseSubtitle =>
      'الرسم العثماني 1.1 · CC BY 3.0 · © 2007–2024 مشروع تنزيل';

  @override
  String get tanzilMetadataLicenseTitle => 'بيانات المصحف من تنزيل';

  @override
  String get tanzilMetadataLicenseSubtitle => 'CC BY · © 2008–2009 تنزيل';

  @override
  String get hisnLicenseTitle => 'أذكار حصن المسلم';

  @override
  String get hisnLicenseSubtitle => 'رخصة MIT · © 2021 عبد الله سلام';

  @override
  String get homePrayerLabel => 'الصلاة القادمة';

  @override
  String get dataSourceUnavailable => 'مصدر البيانات غير مربوط بعد';

  @override
  String get routeError => 'تعذر فتح هذه الشاشة.';
}
