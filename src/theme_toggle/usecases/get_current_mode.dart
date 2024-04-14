import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/theme_toggle/domain/repo.dart';
import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';

class GetCurrentModeFromLocalStorageUseCase
    implements UseCaseswithOutParams<bool> {
  GetCurrentModeFromLocalStorageUseCase(this.repo);
  final ThemeRepo repo;

  @override
  FutureResult<bool> call() => repo.getCurrentModeFromLocalStorage();
}
