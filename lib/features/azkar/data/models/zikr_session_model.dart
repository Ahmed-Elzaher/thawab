class ZikrSessionModel {
  const ZikrSessionModel({required this.text, required this.target});

  factory ZikrSessionModel.fromJson(Map<String, dynamic> json) =>
      ZikrSessionModel(
        text: json[ZikrSessionModelKey.text] as String,
        target: (json[ZikrSessionModelKey.target] as num).toInt(),
      );

  final String text;
  final int target;

  Map<String, dynamic> toJson() => {
    ZikrSessionModelKey.text: text,
    ZikrSessionModelKey.target: target,
  };
}

abstract class ZikrSessionModelKey {
  static const String text = 'text';
  static const String target = 'target';
}
