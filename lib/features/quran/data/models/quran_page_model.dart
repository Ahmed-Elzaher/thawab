import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';
import 'package:thawab/features/quran/data/models/quran_verse_model.dart';

class QuranPageModel extends QuranPageEntity {
  const QuranPageModel({
    required super.surahName,
    required super.pageNumber,
    required super.verses,
  });

  factory QuranPageModel.fromJson(Map<String, dynamic> json) => QuranPageModel(
    surahName: json[QuranPageModelKey.surahName] as String,
    pageNumber: (json[QuranPageModelKey.pageNumber] as num).toInt(),
    verses: (json[QuranPageModelKey.verses] as List<dynamic>)
        .map((item) => QuranVerseModel.fromJson(item as Map<String, dynamic>))
        .toList(growable: false),
  );

  Map<String, dynamic> toJson() => {
    QuranPageModelKey.surahName: surahName,
    QuranPageModelKey.pageNumber: pageNumber,
    QuranPageModelKey.verses: verses
        .map(
          (verse) => QuranVerseModel(
            surahNumber: verse.surahNumber,
            verseNumber: verse.verseNumber,
            text: verse.text,
          ).toJson(),
        )
        .toList(growable: false),
  };
}

abstract class QuranPageModelKey {
  static const String surahName = 'surah_name';
  static const String pageNumber = 'page_number';
  static const String verses = 'verses';
}
