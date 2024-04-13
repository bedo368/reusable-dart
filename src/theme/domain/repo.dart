
import 'package:flutter_useable_widget_and_classes/usecase/usecase.dart';

abstract class ThemeRepo {
  FutureResult<void> toggleTheme();

  FutureResult<bool> getCurrentModeFromLocalStorage();
}
