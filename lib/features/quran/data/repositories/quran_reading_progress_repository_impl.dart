import 'package:thawab/features/quran/data/data_sources/quran_reading_progress_data_source.dart';
import 'package:thawab/features/quran/domain/entities/quran_reading_progress_entity.dart';
import 'package:thawab/features/quran/domain/repositories/quran_reading_progress_repository.dart';

class QuranReadingProgressRepositoryImpl
    implements QuranReadingProgressRepository {
  const QuranReadingProgressRepositoryImpl({required this.dataSource});

  final QuranReadingProgressDataSource dataSource;

  @override
  Future<QuranReadingProgressEntity?> fetch() => dataSource.fetch();

  @override
  Future<void> save(QuranReadingProgressEntity progress) =>
      dataSource.save(progress);
}
