import 'package:thawab/features/prayer/data/models/prayer_schedule_model.dart';

abstract class PrayerDataSource {
  Future<List<PrayerScheduleModel>> fetch();
}

class EmptyPrayerDataSource implements PrayerDataSource {
  @override
  Future<List<PrayerScheduleModel>> fetch() async =>
      const <PrayerScheduleModel>[];
}
