import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeDashboardEntity>>> fetch();
}
