class PrayerTimeModel {
  const PrayerTimeModel({required this.name, required this.time});

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        name: json[PrayerTimeModelKey.name] as String,
        time: json[PrayerTimeModelKey.time] as String,
      );

  final String name;
  final String time;

  Map<String, dynamic> toJson() => {
    PrayerTimeModelKey.name: name,
    PrayerTimeModelKey.time: time,
  };
}

abstract class PrayerTimeModelKey {
  static const String name = 'name';
  static const String time = 'time';
}
