
import 'package:dartz/dartz.dart';
import 'package:flutter_useable_widget_and_classes/errors/failure.dart';

abstract class UseCaseswithParams<Type, Parmas> {
  FutureResult<Type> call(Parmas parmas);
}

abstract class UseCaseswithOutParams<Type> {
  FutureResult<Type> call();
}



typedef FutureResult<T> = Future<Either<Failure ,T >>;
