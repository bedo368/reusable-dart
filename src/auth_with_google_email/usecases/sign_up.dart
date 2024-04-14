import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/repo/auth_repo.dart';

class SignUpUseCase extends UseCaseswithParams<void, SignUpParams> {
  SignUpUseCase(this._repo);
  final AuthRepo _repo;
  @override
  FutureResult<void> call(SignUpParams parmas) => _repo.signUp(
        email: parmas.email,
        fullName: parmas.fullName,
        password: parmas.password,
      );
}

class SignUpParams {
  const SignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
  SignUpParams.empty() : this(password: '', email: '', fullName: '');
  final String fullName;
  final String email;
  final String password;
}
