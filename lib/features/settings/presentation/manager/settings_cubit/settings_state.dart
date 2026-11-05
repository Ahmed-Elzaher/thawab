part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
}

final class SettingsInitial extends SettingsState {
  @override
  List<Object?> get props => [];
}

final class SettingsLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

final class SettingsSuccess extends SettingsState {
  const SettingsSuccess({required this.items});

  final List<SettingsModel> items;

  @override
  List<Object?> get props => [items];
}

final class SettingsFailure extends SettingsState {
  const SettingsFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
