import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();
  FutureResult<void> cacheFirstTimer();

  FutureResult<bool> checkIfUserIsFirstTime();
}
