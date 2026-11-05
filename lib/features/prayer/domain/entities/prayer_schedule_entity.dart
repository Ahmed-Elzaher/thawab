import 'package:thawab/features/prayer/domain/entities/prayer_time_entity.dart';

class PrayerScheduleEntity {
  const PrayerScheduleEntity({
    required this.location,
    required this.nextPrayerLabel,
    required this.countdown,
    required this.prayers,
    required this.qiblaDirection,
  });

  final String location;
  final String nextPrayerLabel;
  final String countdown;
  final List<PrayerTimeEntity> prayers;
  final String qiblaDirection;
}
