import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_useable_widget_and_classes/core/errors/api_exeption.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;
  const Failure({
    required this.message,
    required this.statusCode,
  });

  factory Failure.createNewFailure({required dynamic error}) {
    if (error is Failure) {
      return error;
    }
    if (error is ApiExpetion) {
      return ServerFailure.fromException(error);
    } else if (error is SocketException) {
      return const NoInternetConnectivityFailure();
    } else if (error is FormatException) {
      return ParsingFailure(error.message);
    } else if (error is HttpException) {
      return const UnAuthorisedFailure();
    } else if (error is PathNotFoundException) {
      return const NotFoundFailure();
    } else {
      return const DefaultError();
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ApiExpetion apiExpetion)
      : this(message: apiExpetion.message, statusCode: apiExpetion.statusCode);
}

class NoInternetConnectivityFailure extends Failure {
  const NoInternetConnectivityFailure()
      : super(message: "No Internet Connectivity", statusCode: -1);
}

class DefaultError extends Failure {
  const DefaultError()
      : super(statusCode: 0, message: 'something wrong happen while trying ');
}

class ParsingFailure extends Failure {
  const ParsingFailure(String message)
      : super(message: message, statusCode: 400);
}

class UnAuthorisedFailure extends Failure {
  const UnAuthorisedFailure()
      : super(message: "Unauthorized Access", statusCode: 401);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(message: "Not Found", statusCode: 404);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message)
      : super(message: message, statusCode: 400);
}
