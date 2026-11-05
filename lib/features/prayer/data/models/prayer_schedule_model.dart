import 'package:thawab/features/prayer/data/models/prayer_time_model.dart';
import 'package:thawab/features/prayer/domain/entities/prayer_schedule_entity.dart';

class PrayerScheduleModel extends PrayerScheduleEntity {
  const PrayerScheduleModel({
    required super.location,
    required super.nextPrayerLabel,
    required super.countdown,
    required List<PrayerTimeModel> prayers,
    required super.qiblaDirection,
  }) : super(prayers: prayers);

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

  Map<String, dynamic> toJson() => {
    PrayerScheduleModelKey.location: location,
    PrayerScheduleModelKey.nextPrayerLabel: nextPrayerLabel,
    PrayerScheduleModelKey.countdown: countdown,
    PrayerScheduleModelKey.prayers: prayers
        .map((item) => (item as PrayerTimeModel).toJson())
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
