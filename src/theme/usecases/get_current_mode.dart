import 'package:flutter_useable_widget_and_classes/src/theme/domain/repo.dart';
import 'package:flutter_useable_widget_and_classes/usecase/usecase.dart';

class GetCurrentModeFromLocalStorageUseCase
    implements UseCaseswithOutParams<bool> {
  GetCurrentModeFromLocalStorageUseCase(this.repo);
  final ThemeRepo repo;

  @override
  FutureResult<bool> call() => repo.getCurrentModeFromLocalStorage();
}
