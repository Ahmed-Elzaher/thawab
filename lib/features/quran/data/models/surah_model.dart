class SurahModel {
  const SurahModel({
    required this.number,
    required this.name,
    required this.revelationType,
    required this.verseCount,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
    number: (json[SurahModelKey.number] as num).toInt(),
    name: json[SurahModelKey.name] as String,
    revelationType: json[SurahModelKey.revelationType] as String,
    verseCount: (json[SurahModelKey.verseCount] as num).toInt(),
  );

  final int number;
  final String name;
  final String revelationType;
  final int verseCount;

  Map<String, dynamic> toJson() => {
    SurahModelKey.number: number,
    SurahModelKey.name: name,
    SurahModelKey.revelationType: revelationType,
    SurahModelKey.verseCount: verseCount,
  };
}

abstract class SurahModelKey {
  static const String number = 'number';
  static const String name = 'name';
  static const String revelationType = 'revelation_type';
  static const String verseCount = 'verse_count';
}
