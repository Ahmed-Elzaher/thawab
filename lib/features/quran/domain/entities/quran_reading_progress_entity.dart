class QuranReadingProgressEntity {
  const QuranReadingProgressEntity({
    required this.pageNumber,
    required this.surahName,
  });

  static const int totalPageCount = 604;

  final int pageNumber;
  final String surahName;

  double get progress => pageNumber / totalPageCount;
}
