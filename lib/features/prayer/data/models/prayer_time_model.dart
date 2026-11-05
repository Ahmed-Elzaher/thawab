import 'package:thawab/features/prayer/domain/entities/prayer_time_entity.dart';

class PrayerTimeModel extends PrayerTimeEntity {
  const PrayerTimeModel({required super.name, required super.time});

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        name: json[PrayerTimeModelKey.name] as String,
        time: json[PrayerTimeModelKey.time] as String,
      );

  Map<String, dynamic> toJson() => {
    PrayerTimeModelKey.name: name,
    PrayerTimeModelKey.time: time,
  };
}

abstract class PrayerTimeModelKey {
  static const String name = 'name';
  static const String time = 'time';
}
