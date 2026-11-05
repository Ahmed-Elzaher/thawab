import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';
import 'package:thawab/features/azkar/domain/repositories/azkar_repository.dart';

part 'zikr_session_state.dart';

class ZikrSessionCubit extends Cubit<ZikrSessionState> {
  ZikrSessionCubit({required this.repository}) : super(ZikrSessionInitial());

  final ZikrSessionRepository repository;

  void incrementCount() {
    final currentState = state;
    if (currentState is ZikrSessionSuccess) {
      emit(currentState.copyWith(count: currentState.count + 1));
    }
  }

  void resetCount() {
    final currentState = state;
    if (currentState is ZikrSessionSuccess) {
      emit(currentState.copyWith(count: 0));
    }
  }

  Future<void> fetch() async {
    emit(ZikrSessionLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(ZikrSessionFailure(message: failure.code)),
      (items) => emit(ZikrSessionSuccess(items: items)),
    );
  }
}
