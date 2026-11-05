import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/home/data/models/home_dashboard_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeDashboardModel>>> fetch();
}

class EmptyHomeRepository implements HomeRepository {
  @override
  Future<Either<Failure, List<HomeDashboardModel>>> fetch() async =>
      const Right(<HomeDashboardModel>[]);
}
