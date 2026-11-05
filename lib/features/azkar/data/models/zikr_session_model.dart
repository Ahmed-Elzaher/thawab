import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';

class ZikrSessionModel extends ZikrSessionEntity {
  const ZikrSessionModel({
    required super.categoryId,
    required super.text,
    required super.target,
  });

  factory ZikrSessionModel.fromJson(Map<String, dynamic> json) =>
      ZikrSessionModel(
        categoryId: json[ZikrSessionModelKey.categoryId] as String,
        text: json[ZikrSessionModelKey.text] as String,
        target: (json[ZikrSessionModelKey.target] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
    ZikrSessionModelKey.categoryId: categoryId,
    ZikrSessionModelKey.text: text,
    ZikrSessionModelKey.target: target,
  };
}

abstract class ZikrSessionModelKey {
  static const String categoryId = 'category_id';
  static const String text = 'text';
  static const String target = 'target';
}
