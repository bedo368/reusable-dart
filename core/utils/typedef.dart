import 'package:dartz/dartz.dart';
import 'package:flutter_useable_widget_and_classes/core/errors/failure.dart';

typedef DataMap = Map<String, dynamic>;
typedef FutureResult<T> = Future<Either<Failure, T>>;
