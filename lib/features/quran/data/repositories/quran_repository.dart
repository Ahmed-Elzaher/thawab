import 'package:dartz/dartz.dart';
import 'package:thawab/core/errors/failure.dart';
import 'package:thawab/features/quran/data/models/quran_page_model.dart';
import 'package:thawab/features/quran/data/models/surah_model.dart';

abstract class QuranPageRepository {
  Future<Either<Failure, List<QuranPageModel>>> fetch();
}

class EmptyQuranPageRepository implements QuranPageRepository {
  @override
  Future<Either<Failure, List<QuranPageModel>>> fetch() async =>
      const Right(<QuranPageModel>[]);
}

abstract class SurahRepository {
  Future<Either<Failure, List<SurahModel>>> fetch();
}

class EmptySurahRepository implements SurahRepository {
  @override
  Future<Either<Failure, List<SurahModel>>> fetch() async =>
      const Right(<SurahModel>[]);
}
