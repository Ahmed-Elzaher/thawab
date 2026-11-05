import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/prayer/data/data_sources/prayer_data_source.dart';
import 'package:thawab/features/prayer/domain/entities/prayer_schedule_entity.dart';
import 'package:thawab/features/prayer/domain/repositories/prayer_repository.dart';

class PrayerRepositoryImpl implements PrayerRepository {
  const PrayerRepositoryImpl({required this.dataSource});

  final PrayerDataSource dataSource;

  @override
  Future<Either<Failure, List<PrayerScheduleEntity>>> fetch() async =>
      Right<Failure, List<PrayerScheduleEntity>>(await dataSource.fetch());
}
