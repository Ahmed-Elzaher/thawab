import 'package:thawab/features/home/data/models/home_dashboard_model.dart';

abstract class HomeDataSource {
  Future<List<HomeDashboardModel>> fetch();
}

class EmptyHomeDataSource implements HomeDataSource {
  @override
  Future<List<HomeDashboardModel>> fetch() async =>
      const <HomeDashboardModel>[];
}
