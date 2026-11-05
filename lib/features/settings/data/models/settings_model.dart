class SettingsModel {
  const SettingsModel({
    required this.appearance,
    required this.quranFontSize,
    required this.location,
    required this.prayerCalculationMethod,
    required this.notifications,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    appearance: json[SettingsModelKey.appearance] as String,
    quranFontSize: json[SettingsModelKey.quranFontSize] as String,
    location: json[SettingsModelKey.location] as String,
    prayerCalculationMethod:
        json[SettingsModelKey.prayerCalculationMethod] as String,
    notifications: json[SettingsModelKey.notifications] as String,
  );

  final String appearance;
  final String quranFontSize;
  final String location;
  final String prayerCalculationMethod;
  final String notifications;

  Map<String, dynamic> toJson() => {
    SettingsModelKey.appearance: appearance,
    SettingsModelKey.quranFontSize: quranFontSize,
    SettingsModelKey.location: location,
    SettingsModelKey.prayerCalculationMethod: prayerCalculationMethod,
    SettingsModelKey.notifications: notifications,
  };
}

abstract class SettingsModelKey {
  static const String appearance = 'appearance';
  static const String quranFontSize = 'quran_font_size';
  static const String location = 'location';
  static const String prayerCalculationMethod = 'prayer_calculation_method';
  static const String notifications = 'notifications';
}
