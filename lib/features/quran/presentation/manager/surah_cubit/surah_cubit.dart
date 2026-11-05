import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';
import 'package:thawab/features/quran/domain/repositories/quran_repository.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit({required this.repository}) : super(SurahInitial());

  final SurahRepository repository;

  Future<void> fetch() async {
    emit(SurahLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(SurahFailure(message: failure.code)),
      (items) => emit(SurahSuccess(items: items)),
    );
  }
}
