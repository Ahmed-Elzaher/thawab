import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/prayer/data/models/prayer_schedule_model.dart';
import 'package:thawab/features/prayer/data/repositories/prayer_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit({required this.repository}) : super(PrayerInitial());

  final PrayerRepository repository;

  Future<void> fetch() async {
    emit(PrayerLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(PrayerFailure(message: failure.message)),
      (items) => emit(PrayerSuccess(items: items)),
    );
  }
}
