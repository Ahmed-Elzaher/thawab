part of 'quran_page_cubit.dart';

sealed class QuranPageState extends Equatable {
  const QuranPageState();
}

final class QuranPageInitial extends QuranPageState {
  @override
  List<Object?> get props => [];
}

final class QuranPageLoading extends QuranPageState {
  @override
  List<Object?> get props => [];
}

final class QuranPageSuccess extends QuranPageState {
  const QuranPageSuccess({required this.items});

  final List<QuranPageEntity> items;

  @override
  List<Object?> get props => [items];
}

final class QuranPageFailure extends QuranPageState {
  const QuranPageFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
