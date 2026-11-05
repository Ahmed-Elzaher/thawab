part of 'prayer_cubit.dart';

sealed class PrayerState extends Equatable {
  const PrayerState();
}

final class PrayerInitial extends PrayerState {
  @override
  List<Object?> get props => [];
}

final class PrayerLoading extends PrayerState {
  @override
  List<Object?> get props => [];
}

final class PrayerSuccess extends PrayerState {
  const PrayerSuccess({required this.items});

  final List<PrayerScheduleModel> items;

  @override
  List<Object?> get props => [items];
}

final class PrayerFailure extends PrayerState {
  const PrayerFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
