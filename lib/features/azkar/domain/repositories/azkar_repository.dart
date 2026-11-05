import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';

abstract class AzkarCategoryRepository {
  Future<Either<Failure, List<AzkarCategoryEntity>>> fetch();
}

abstract class ZikrSessionRepository {
  Future<Either<Failure, List<ZikrSessionEntity>>> fetch();
}
