import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';

abstract class QuranPageRepository {
  Future<Either<Failure, List<QuranPageEntity>>> fetch();
}

abstract class SurahRepository {
  Future<Either<Failure, List<SurahEntity>>> fetch();
}
