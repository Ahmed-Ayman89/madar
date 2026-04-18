import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsCubit(this._settingsRepository) : super(SettingsInitial());

  Future<void> getSettings({String? lang}) async {
    try {
      emit(SettingsLoading());
      final response = await _settingsRepository.getSettings(lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(SettingsLoaded(response.data!));
        } else {
          emit(SettingsError(response.message ?? 'Failed to load settings'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(SettingsError('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
