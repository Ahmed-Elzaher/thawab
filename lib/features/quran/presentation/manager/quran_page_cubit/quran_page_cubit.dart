import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/quran/data/models/quran_page_model.dart';
import 'package:thawab/features/quran/data/repositories/quran_repository.dart';

part 'quran_page_state.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit({required this.repository}) : super(QuranPageInitial());

  final QuranPageRepository repository;

  Future<void> fetch() async {
    emit(QuranPageLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(QuranPageFailure(message: failure.message)),
      (items) => emit(QuranPageSuccess(items: items)),
    );
  }
}
