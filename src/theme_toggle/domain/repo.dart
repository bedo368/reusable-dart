
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';

abstract class ThemeRepo {
  FutureResult<void> toggleTheme();

  FutureResult<bool> getCurrentModeFromLocalStorage();
}
