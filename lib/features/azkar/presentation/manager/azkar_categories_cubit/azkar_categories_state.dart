part of 'azkar_categories_cubit.dart';

sealed class AzkarCategoryState extends Equatable {
  const AzkarCategoryState();
}

final class AzkarCategoryInitial extends AzkarCategoryState {
  @override
  List<Object?> get props => [];
}

final class AzkarCategoryLoading extends AzkarCategoryState {
  @override
  List<Object?> get props => [];
}

final class AzkarCategorySuccess extends AzkarCategoryState {
  const AzkarCategorySuccess({required this.items});

  final List<AzkarCategoryModel> items;

  @override
  List<Object?> get props => [items];
}

final class AzkarCategoryFailure extends AzkarCategoryState {
  const AzkarCategoryFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
