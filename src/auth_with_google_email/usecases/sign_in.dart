import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/entities/user.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/repo/auth_repo.dart';

class SignInUseCase extends UseCaseswithParams<LocalUser, SignInParams> {
  SignInUseCase(this._repo);
  final AuthRepo _repo;
  @override
  FutureResult<LocalUser> call(SignInParams parmas) =>
      _repo.signIn(email: parmas.email, password: parmas.password);
}

class SignInParams {
  const SignInParams({required this.password, required this.email});

  SignInParams.empty() : this(password: '', email: '');
  final String email;
  final String password;
}
