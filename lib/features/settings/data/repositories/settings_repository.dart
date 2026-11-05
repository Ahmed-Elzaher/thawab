import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/settings/data/models/settings_model.dart';

abstract class SettingsRepository {
  Future<Either<Failure, List<SettingsModel>>> fetch();
}

class EmptySettingsRepository implements SettingsRepository {
  @override
  Future<Either<Failure, List<SettingsModel>>> fetch() async =>
      const Right(<SettingsModel>[]);
}
