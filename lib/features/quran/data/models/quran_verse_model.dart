import 'package:thawab/features/quran/domain/entities/quran_verse_entity.dart';

class QuranVerseModel extends QuranVerseEntity {
  const QuranVerseModel({
    required super.surahNumber,
    required super.verseNumber,
    required super.text,
  });

  factory QuranVerseModel.fromJson(Map<String, dynamic> json) =>
      QuranVerseModel(
        surahNumber: (json[QuranVerseModelKey.surahNumber] as num).toInt(),
        verseNumber: (json[QuranVerseModelKey.verseNumber] as num).toInt(),
        text: json[QuranVerseModelKey.text] as String,
      );

  Map<String, dynamic> toJson() => {
    QuranVerseModelKey.surahNumber: surahNumber,
    QuranVerseModelKey.verseNumber: verseNumber,
    QuranVerseModelKey.text: text,
  };
}

abstract class QuranVerseModelKey {
  static const String surahNumber = 'surah_number';
  static const String verseNumber = 'verse_number';
  static const String text = 'text';
}
