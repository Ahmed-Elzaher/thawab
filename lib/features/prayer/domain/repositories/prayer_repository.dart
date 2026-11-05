import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/prayer/domain/entities/prayer_schedule_entity.dart';

abstract class PrayerRepository {
  Future<Either<Failure, List<PrayerScheduleEntity>>> fetch();
}
