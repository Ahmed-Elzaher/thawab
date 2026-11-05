import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/home/data/data_sources/home_data_source.dart';
import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:thawab/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.dataSource});

  final HomeDataSource dataSource;

  @override
  Future<Either<Failure, List<HomeDashboardEntity>>> fetch() async {
    try {
      return Right<Failure, List<HomeDashboardEntity>>(
        await dataSource.fetch(),
      );
    } on Object {
      return const Left<Failure, List<HomeDashboardEntity>>(
        DataSourceUnavailableFailure(),
      );
    }
  }
}
