import 'package:thawab/features/prayer/data/models/prayer_time_model.dart';

class PrayerScheduleModel {
  const PrayerScheduleModel({
    required this.location,
    required this.nextPrayerLabel,
    required this.countdown,
    required this.prayers,
    required this.qiblaDirection,
  });

  factory PrayerScheduleModel.fromJson(Map<String, dynamic> json) =>
      PrayerScheduleModel(
        location: json[PrayerScheduleModelKey.location] as String,
        nextPrayerLabel: json[PrayerScheduleModelKey.nextPrayerLabel] as String,
        countdown: json[PrayerScheduleModelKey.countdown] as String,
        prayers: (json[PrayerScheduleModelKey.prayers] as List<dynamic>)
            .map(
              (item) => PrayerTimeModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
        qiblaDirection: json[PrayerScheduleModelKey.qiblaDirection] as String,
      );

  final String location;
  final String nextPrayerLabel;
  final String countdown;
  final List<PrayerTimeModel> prayers;
  final String qiblaDirection;

  Map<String, dynamic> toJson() => {
    PrayerScheduleModelKey.location: location,
    PrayerScheduleModelKey.nextPrayerLabel: nextPrayerLabel,
    PrayerScheduleModelKey.countdown: countdown,
    PrayerScheduleModelKey.prayers: prayers
        .map((item) => item.toJson())
        .toList(),
    PrayerScheduleModelKey.qiblaDirection: qiblaDirection,
  };
}

abstract class PrayerScheduleModelKey {
  static const String location = 'location';
  static const String nextPrayerLabel = 'next_prayer_label';
  static const String countdown = 'countdown';
  static const String prayers = 'prayers';
  static const String qiblaDirection = 'qibla_direction';
}
