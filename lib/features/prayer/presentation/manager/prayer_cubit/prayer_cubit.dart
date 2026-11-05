import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/prayer/domain/entities/prayer_schedule_entity.dart';
import 'package:thawab/features/prayer/domain/repositories/prayer_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit({required this.repository}) : super(PrayerInitial());

  final PrayerRepository repository;

  Future<void> fetch() async {
    emit(PrayerLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(PrayerFailure(message: failure.code)),
      (items) => emit(PrayerSuccess(items: items)),
    );
  }
}
