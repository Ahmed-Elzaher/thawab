class HomeDashboardEntity {
  const HomeDashboardEntity({
    required this.hijriDate,
    required this.nextPrayer,
    required this.prayerTime,
    required this.remainingTime,
    this.readingResume,
    this.readingProgress,
    this.readingPageNumber,
  });

  final String hijriDate;
  final String nextPrayer;
  final String prayerTime;
  final String remainingTime;
  final String? readingResume;
  final double? readingProgress;
  final int? readingPageNumber;
}
