import 'package:thawab/features/quran/domain/entities/quran_reading_progress_entity.dart';

abstract class QuranReadingProgressRepository {
  Future<QuranReadingProgressEntity?> fetch();
  Future<void> save(QuranReadingProgressEntity progress);
}
