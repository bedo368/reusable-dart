part of 'theme_controller_cubit.dart';

sealed class ThemeControllerState extends Equatable {
  const ThemeControllerState();

  @override
  List<Object> get props => [];
}

final class ThemeControllerInitial extends ThemeControllerState {}

final class ThemeToggleStart extends ThemeControllerState {}

final class ThemeToggleDone extends ThemeControllerState {}

final class ThemeErorr extends ThemeControllerState {
  const ThemeErorr({required this.message});
  final String message;
}

final class ThemeGetStart extends ThemeControllerState {}

final class ThemeGetDone extends ThemeControllerState {
  const ThemeGetDone({required this.isDark});
  final bool isDark;
}
