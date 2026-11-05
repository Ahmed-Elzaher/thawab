import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/azkar/data/models/azkar_category_model.dart';
import 'package:thawab/features/azkar/data/models/zikr_session_model.dart';

abstract class AzkarCategoryRepository {
  Future<Either<Failure, List<AzkarCategoryModel>>> fetch();
}

class EmptyAzkarCategoryRepository implements AzkarCategoryRepository {
  @override
  Future<Either<Failure, List<AzkarCategoryModel>>> fetch() async =>
      const Right(<AzkarCategoryModel>[]);
}

abstract class ZikrSessionRepository {
  Future<Either<Failure, List<ZikrSessionModel>>> fetch();
}

class EmptyZikrSessionRepository implements ZikrSessionRepository {
  @override
  Future<Either<Failure, List<ZikrSessionModel>>> fetch() async =>
      const Right(<ZikrSessionModel>[]);
}
