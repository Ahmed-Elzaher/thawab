import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';

class QuranPageModel extends QuranPageEntity {
  const QuranPageModel({
    required super.surahName,
    required super.pageNumber,
    required super.verses,
  });

  factory QuranPageModel.fromJson(Map<String, dynamic> json) => QuranPageModel(
    surahName: json[QuranPageModelKey.surahName] as String,
    pageNumber: (json[QuranPageModelKey.pageNumber] as num).toInt(),
    verses: List<String>.from(json[QuranPageModelKey.verses] as List<dynamic>),
  );

  Map<String, dynamic> toJson() => {
    QuranPageModelKey.surahName: surahName,
    QuranPageModelKey.pageNumber: pageNumber,
    QuranPageModelKey.verses: verses,
  };
}

abstract class QuranPageModelKey {
  static const String surahName = 'surah_name';
  static const String pageNumber = 'page_number';
  static const String verses = 'verses';
}
