


import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';

abstract class UseCaseswithParams<Type, Parmas> {
  FutureResult<Type> call(Parmas parmas);
}

abstract class UseCaseswithOutParams<Type> {
  FutureResult<Type> call();
}



