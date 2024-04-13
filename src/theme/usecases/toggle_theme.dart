
import 'package:flutter_useable_widget_and_classes/src/theme/domain/repo.dart';
import 'package:flutter_useable_widget_and_classes/usecase/usecase.dart';

class ToggleThemeUseCase implements UseCaseswithOutParams<void> {
  ToggleThemeUseCase(this.repo);

  final ThemeRepo repo;

  @override
  FutureResult<void> call() => repo.toggleTheme();
}
