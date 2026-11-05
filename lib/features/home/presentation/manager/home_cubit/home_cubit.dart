import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:thawab/features/home/domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(HomeInitial());

  final HomeRepository repository;

  Future<void> fetch() async {
    emit(HomeLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(HomeFailure(message: failure.code)),
      (items) => emit(HomeSuccess(items: items)),
    );
  }
}
