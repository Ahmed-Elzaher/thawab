import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';

class HomeDashboardModel extends HomeDashboardEntity {
  const HomeDashboardModel({
    required super.hijriDate,
    required super.nextPrayer,
    required super.prayerTime,
    required super.remainingTime,
    super.readingResume,
    super.readingProgress,
    super.readingPageNumber,
  });

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      HomeDashboardModel(
        hijriDate: json[HomeDashboardModelKey.hijriDate] as String,
        nextPrayer: json[HomeDashboardModelKey.nextPrayer] as String,
        prayerTime: json[HomeDashboardModelKey.prayerTime] as String,
        remainingTime: json[HomeDashboardModelKey.remainingTime] as String,
        readingResume: json[HomeDashboardModelKey.readingResume] as String?,
        readingProgress: (json[HomeDashboardModelKey.readingProgress] as num?)
            ?.toDouble(),
        readingPageNumber:
            json[HomeDashboardModelKey.readingPageNumber] as int?,
      );

  Map<String, dynamic> toJson() => {
    HomeDashboardModelKey.hijriDate: hijriDate,
    HomeDashboardModelKey.nextPrayer: nextPrayer,
    HomeDashboardModelKey.prayerTime: prayerTime,
    HomeDashboardModelKey.remainingTime: remainingTime,
    HomeDashboardModelKey.readingResume: readingResume,
    HomeDashboardModelKey.readingProgress: readingProgress,
    HomeDashboardModelKey.readingPageNumber: readingPageNumber,
  };
}

abstract class HomeDashboardModelKey {
  static const String hijriDate = 'hijri_date';
  static const String nextPrayer = 'next_prayer';
  static const String prayerTime = 'prayer_time';
  static const String remainingTime = 'remaining_time';
  static const String readingResume = 'reading_resume';
  static const String readingProgress = 'reading_progress';
  static const String readingPageNumber = 'reading_page_number';
}
