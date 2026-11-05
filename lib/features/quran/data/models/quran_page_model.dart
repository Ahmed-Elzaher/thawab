class QuranPageModel {
  const QuranPageModel({
    required this.surahName,
    required this.pageNumber,
    required this.verses,
  });

  factory QuranPageModel.fromJson(Map<String, dynamic> json) => QuranPageModel(
    surahName: json[QuranPageModelKey.surahName] as String,
    pageNumber: (json[QuranPageModelKey.pageNumber] as num).toInt(),
    verses: List<String>.from(json[QuranPageModelKey.verses] as List<dynamic>),
  );

  final String surahName;
  final int pageNumber;
  final List<String> verses;

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
