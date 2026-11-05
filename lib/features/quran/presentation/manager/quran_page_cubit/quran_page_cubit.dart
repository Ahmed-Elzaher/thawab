import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';
import 'package:thawab/features/quran/domain/repositories/quran_repository.dart';

part 'quran_page_state.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit({required this.repository}) : super(QuranPageInitial());

  final QuranPageRepository repository;

  Future<void> fetch() async {
    emit(QuranPageLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(QuranPageFailure(message: failure.code)),
      (items) => emit(QuranPageSuccess(items: items)),
    );
  }
}
