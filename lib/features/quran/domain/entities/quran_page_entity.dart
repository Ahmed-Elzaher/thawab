class QuranPageEntity {
  const QuranPageEntity({
    required this.surahName,
    required this.pageNumber,
    required this.verses,
  });

  final String surahName;
  final int pageNumber;
  final List<String> verses;
}
