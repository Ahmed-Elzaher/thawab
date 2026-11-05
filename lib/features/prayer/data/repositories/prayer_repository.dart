import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/prayer/data/models/prayer_schedule_model.dart';

abstract class PrayerRepository {
  Future<Either<Failure, List<PrayerScheduleModel>>> fetch();
}

class EmptyPrayerRepository implements PrayerRepository {
  @override
  Future<Either<Failure, List<PrayerScheduleModel>>> fetch() async =>
      const Right(<PrayerScheduleModel>[]);
}
