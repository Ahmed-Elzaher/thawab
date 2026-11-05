import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/azkar/data/models/azkar_category_model.dart';
import 'package:thawab/features/azkar/data/repositories/azkar_repository.dart';

part 'azkar_categories_state.dart';

class AzkarCategoriesCubit extends Cubit<AzkarCategoryState> {
  AzkarCategoriesCubit({required this.repository})
    : super(AzkarCategoryInitial());

  final AzkarCategoryRepository repository;

  Future<void> fetch() async {
    emit(AzkarCategoryLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(AzkarCategoryFailure(message: failure.message)),
      (items) => emit(AzkarCategorySuccess(items: items)),
    );
  }
}
