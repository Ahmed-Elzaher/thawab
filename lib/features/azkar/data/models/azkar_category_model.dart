import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';

class AzkarCategoryModel extends AzkarCategoryEntity {
  const AzkarCategoryModel({
    required super.id,
    required super.name,
    required super.entryCount,
  });

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) =>
      AzkarCategoryModel(
        id: json[AzkarCategoryModelKey.id] as String,
        name: json[AzkarCategoryModelKey.name] as String,
        entryCount: (json[AzkarCategoryModelKey.entryCount] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
    AzkarCategoryModelKey.id: id,
    AzkarCategoryModelKey.name: name,
    AzkarCategoryModelKey.entryCount: entryCount,
  };
}

abstract class AzkarCategoryModelKey {
  static const String id = 'id';
  static const String name = 'name';
  static const String entryCount = 'entry_count';
}
