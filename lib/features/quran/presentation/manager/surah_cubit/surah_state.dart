part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();
}

final class SurahInitial extends SurahState {
  @override
  List<Object?> get props => [];
}

final class SurahLoading extends SurahState {
  @override
  List<Object?> get props => [];
}

final class SurahSuccess extends SurahState {
  const SurahSuccess({required this.items});

  final List<SurahModel> items;

  @override
  List<Object?> get props => [items];
}

final class SurahFailure extends SurahState {
  const SurahFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
