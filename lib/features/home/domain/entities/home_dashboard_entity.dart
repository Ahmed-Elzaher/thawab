class HomeDashboardEntity {
  const HomeDashboardEntity({
    required this.hijriDate,
    required this.nextPrayer,
    required this.prayerTime,
    required this.remainingTime,
    required this.readingResume,
    required this.readingProgress,
  });

  final String hijriDate;
  final String nextPrayer;
  final String prayerTime;
  final String remainingTime;
  final String readingResume;
  final double readingProgress;
}
