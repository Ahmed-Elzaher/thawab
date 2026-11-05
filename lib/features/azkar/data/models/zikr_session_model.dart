import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';

class ZikrSessionModel extends ZikrSessionEntity {
  const ZikrSessionModel({required super.text, required super.target});

  factory ZikrSessionModel.fromJson(Map<String, dynamic> json) =>
      ZikrSessionModel(
        text: json[ZikrSessionModelKey.text] as String,
        target: (json[ZikrSessionModelKey.target] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
    ZikrSessionModelKey.text: text,
    ZikrSessionModelKey.target: target,
  };
}

abstract class ZikrSessionModelKey {
  static const String text = 'text';
  static const String target = 'target';
}
