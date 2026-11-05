import 'package:thawab/features/quran/domain/entities/surah_entity.dart';

class SurahModel extends SurahEntity {
  const SurahModel({
    required super.number,
    required super.name,
    required super.revelationType,
    required super.verseCount,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
    number: (json[SurahModelKey.number] as num).toInt(),
    name: json[SurahModelKey.name] as String,
    revelationType: json[SurahModelKey.revelationType] as String,
    verseCount: (json[SurahModelKey.verseCount] as num).toInt(),
  );

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
