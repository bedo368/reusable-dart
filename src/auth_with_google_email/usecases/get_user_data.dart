import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/entities/user.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/repo/auth_repo.dart';

class GetUserDataUseCase extends UseCaseswithOutParams<LocalUser> {
  GetUserDataUseCase(this._repo);
  final AuthRepo _repo;
  @override
  FutureResult<LocalUser> call() => _repo.getUserData();
}
