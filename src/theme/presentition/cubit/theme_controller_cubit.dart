import 'package:bloc/bloc.dart';
import 'package:flutter_useable_widget_and_classes/src/theme/usecases/get_current_mode.dart';
import 'package:flutter_useable_widget_and_classes/src/theme/usecases/toggle_theme.dart';
import 'package:equatable/equatable.dart';

part 'theme_controller_state.dart';

class ThemeControllerCubit extends Cubit<ThemeControllerState> {
  ThemeControllerCubit({
    required GetCurrentModeFromLocalStorageUseCase getCurrentMode,
    required ToggleThemeUseCase toggleTheme,
  })  : _toggleTheme = toggleTheme,
        _getCurrentMode = getCurrentMode,
        super(ThemeControllerInitial());
  final GetCurrentModeFromLocalStorageUseCase _getCurrentMode;
  final ToggleThemeUseCase _toggleTheme;
  bool isDark = false;
  Future<void> getCurrentTheme() async {
    emit(ThemeGetStart());
    final currentMode = await _getCurrentMode();
    currentMode.fold(
      (l) => emit(ThemeErorr(message: l.message)),
      (r) {
        emit(ThemeGetDone(isDark: r));
        isDark = r;
      },
    );
  }

  Future<void> toggleTheme() async {
    emit(ThemeToggleStart());
    final toggleTheme = await _toggleTheme();

    toggleTheme.fold(
      (l) => ThemeErorr(message: l.message),
      (r) {
        emit(ThemeToggleDone());
        isDark = !isDark;
      },
    );
  }
}
