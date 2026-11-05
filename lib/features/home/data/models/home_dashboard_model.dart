class HomeDashboardModel {
  const HomeDashboardModel({
    required this.hijriDate,
    required this.nextPrayer,
    required this.prayerTime,
    required this.remainingTime,
    required this.readingResume,
    required this.readingProgress,
  });

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) =>
      HomeDashboardModel(
        hijriDate: json[HomeDashboardModelKey.hijriDate] as String,
        nextPrayer: json[HomeDashboardModelKey.nextPrayer] as String,
        prayerTime: json[HomeDashboardModelKey.prayerTime] as String,
        remainingTime: json[HomeDashboardModelKey.remainingTime] as String,
        readingResume: json[HomeDashboardModelKey.readingResume] as String,
        readingProgress: (json[HomeDashboardModelKey.readingProgress] as num)
            .toDouble(),
      );

  final String hijriDate;
  final String nextPrayer;
  final String prayerTime;
  final String remainingTime;
  final String readingResume;
  final double readingProgress;

  Map<String, dynamic> toJson() => {
    HomeDashboardModelKey.hijriDate: hijriDate,
    HomeDashboardModelKey.nextPrayer: nextPrayer,
    HomeDashboardModelKey.prayerTime: prayerTime,
    HomeDashboardModelKey.remainingTime: remainingTime,
    HomeDashboardModelKey.readingResume: readingResume,
    HomeDashboardModelKey.readingProgress: readingProgress,
  };
}

abstract class HomeDashboardModelKey {
  static const String hijriDate = 'hijri_date';
  static const String nextPrayer = 'next_prayer';
  static const String prayerTime = 'prayer_time';
  static const String remainingTime = 'remaining_time';
  static const String readingResume = 'reading_resume';
  static const String readingProgress = 'reading_progress';
}
