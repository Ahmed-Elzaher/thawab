part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeSuccess extends HomeState {
  const HomeSuccess({required this.items});

  final List<HomeDashboardModel> items;

  @override
  List<Object?> get props => [items];
}

final class HomeFailure extends HomeState {
  const HomeFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
