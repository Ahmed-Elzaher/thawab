class AzkarCategoryModel {
  const AzkarCategoryModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) =>
      AzkarCategoryModel(
        id: json[AzkarCategoryModelKey.id] as String,
        name: json[AzkarCategoryModelKey.name] as String,
        description: json[AzkarCategoryModelKey.description] as String,
      );

  final String id;
  final String name;
  final String description;

  Map<String, dynamic> toJson() => {
    AzkarCategoryModelKey.id: id,
    AzkarCategoryModelKey.name: name,
    AzkarCategoryModelKey.description: description,
  };
}

abstract class AzkarCategoryModelKey {
  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
}
