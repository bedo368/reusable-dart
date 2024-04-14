import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/repo/auth_repo.dart';

class ForgetPasswordUseCases
    extends UseCaseswithParams<void, ForgetPasswordParams> {
  ForgetPasswordUseCases(this._repo);
  final AuthRepo _repo;
  @override
  FutureResult<void> call(ForgetPasswordParams parmas) =>
      _repo.forgetPassword(parmas.email);
}

class ForgetPasswordParams {
  const ForgetPasswordParams({required this.email});
  final String email;
}
