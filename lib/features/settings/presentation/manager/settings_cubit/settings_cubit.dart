import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/features/settings/domain/entities/settings_entity.dart';
import 'package:thawab/features/settings/domain/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.repository}) : super(SettingsInitial());

  final SettingsRepository repository;

  Future<void> fetch() async {
    emit(SettingsLoading());
    final result = await repository.fetch();
    result.fold(
      (failure) => emit(SettingsFailure(message: failure.code)),
      (items) => emit(SettingsSuccess(items: items)),
    );
  }
}
