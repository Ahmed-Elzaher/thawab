import 'package:thawab/features/settings/data/models/settings_model.dart';

abstract class SettingsDataSource {
  Future<List<SettingsModel>> fetch();
}

class EmptySettingsDataSource implements SettingsDataSource {
  @override
  Future<List<SettingsModel>> fetch() async => const <SettingsModel>[];
}
