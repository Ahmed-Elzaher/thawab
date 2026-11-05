class SettingsEntity {
  const SettingsEntity({
    required this.appearance,
    required this.quranFontSize,
    required this.location,
    required this.prayerCalculationMethod,
    required this.notifications,
  });

  final String appearance;
  final String quranFontSize;
  final String location;
  final String prayerCalculationMethod;
  final String notifications;
}
