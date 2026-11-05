import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/settings/data/data_sources/settings_data_source.dart';
import 'package:thawab/features/settings/domain/entities/settings_entity.dart';
import 'package:thawab/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({required this.dataSource});

  final SettingsDataSource dataSource;

  @override
  Future<Either<Failure, List<SettingsEntity>>> fetch() async =>
      Right<Failure, List<SettingsEntity>>(await dataSource.fetch());
}
