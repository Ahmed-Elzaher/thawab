import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/domain/repositories/azkar_repository.dart';

part 'azkar_categories_state.dart';

class AzkarCategoriesCubit extends Cubit<AzkarCategoryState> {
  AzkarCategoriesCubit({required this.repository})
    : super(AzkarCategoryInitial());

  final AzkarCategoryRepository repository;

  Future<void> fetch() async {
    emit(AzkarCategoryLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(AzkarCategoryFailure(message: failure.code)),
      (items) => emit(AzkarCategorySuccess(items: items)),
    );
  }
}
