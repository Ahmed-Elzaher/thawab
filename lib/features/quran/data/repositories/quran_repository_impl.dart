import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/quran/data/data_sources/quran_data_source.dart';
import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';
import 'package:thawab/features/quran/domain/repositories/quran_repository.dart';

class QuranPageRepositoryImpl implements QuranPageRepository {
  const QuranPageRepositoryImpl({required this.dataSource});

  final QuranDataSource dataSource;

  @override
  Future<Either<Failure, List<QuranPageEntity>>> fetch() async =>
      Right<Failure, List<QuranPageEntity>>(await dataSource.fetchPages());
}

class SurahRepositoryImpl implements SurahRepository {
  const SurahRepositoryImpl({required this.dataSource});

  final QuranDataSource dataSource;

  @override
  Future<Either<Failure, List<SurahEntity>>> fetch() async =>
      Right<Failure, List<SurahEntity>>(await dataSource.fetchSurahs());
}
