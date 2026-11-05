class ZikrSessionEntity {
  const ZikrSessionEntity({
    required this.categoryId,
    required this.text,
    required this.target,
  });

  final String categoryId;
  final String text;
  final int target;
}
