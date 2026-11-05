import 'package:thawab/features/quran/domain/entities/quran_verse_entity.dart';

class QuranPageEntity {
  const QuranPageEntity({
    required this.surahName,
    required this.pageNumber,
    required this.verses,
  });

  final String surahName;
  final int pageNumber;
  final List<QuranVerseEntity> verses;
}
