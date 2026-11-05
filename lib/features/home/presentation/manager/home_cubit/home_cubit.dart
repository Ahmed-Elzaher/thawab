import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/home/data/models/home_dashboard_model.dart';
import 'package:thawab/features/home/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(HomeInitial());

  final HomeRepository repository;

  Future<void> fetch() async {
    emit(HomeLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (items) => emit(HomeSuccess(items: items)),
    );
  }
}
