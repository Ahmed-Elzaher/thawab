part of 'zikr_session_cubit.dart';

sealed class ZikrSessionState extends Equatable {
  const ZikrSessionState();
}

final class ZikrSessionInitial extends ZikrSessionState {
  @override
  List<Object?> get props => [];
}

final class ZikrSessionLoading extends ZikrSessionState {
  @override
  List<Object?> get props => [];
}

final class ZikrSessionSuccess extends ZikrSessionState {
  const ZikrSessionSuccess({
    required this.items,
    this.count = 0,
    this.activeIndex = 0,
  });

  final List<ZikrSessionEntity> items;
  final int count;
  final int activeIndex;

  ZikrSessionSuccess copyWith({int? count, int? activeIndex}) =>
      ZikrSessionSuccess(
        items: items,
        count: count ?? this.count,
        activeIndex: activeIndex ?? this.activeIndex,
      );

  @override
  List<Object?> get props => [items, count, activeIndex];
}

final class ZikrSessionFailure extends ZikrSessionState {
  const ZikrSessionFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
