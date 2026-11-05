import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/azkar/data/data_sources/azkar_data_source.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';
import 'package:thawab/features/azkar/domain/repositories/azkar_repository.dart';

class AzkarCategoryRepositoryImpl implements AzkarCategoryRepository {
  const AzkarCategoryRepositoryImpl({required this.dataSource});

  final AzkarDataSource dataSource;

  @override
  Future<Either<Failure, List<AzkarCategoryEntity>>> fetch() async =>
      Right<Failure, List<AzkarCategoryEntity>>(
        await dataSource.fetchCategories(),
      );
}

class ZikrSessionRepositoryImpl implements ZikrSessionRepository {
  const ZikrSessionRepositoryImpl({required this.dataSource});

  final AzkarDataSource dataSource;

  @override
  Future<Either<Failure, List<ZikrSessionEntity>>> fetch() async =>
      Right<Failure, List<ZikrSessionEntity>>(await dataSource.fetchSession());
}
