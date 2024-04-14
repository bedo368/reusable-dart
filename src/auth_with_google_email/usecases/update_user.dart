import 'dart:io';

import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/repo/auth_repo.dart';

class UpdateUserUseCases extends UseCaseswithParams<void, UpdateUserParams> {
  UpdateUserUseCases(this._authRepo);
  final AuthRepo _authRepo;
  @override
  FutureResult<void> call(UpdateUserParams parmas) => _authRepo.updateUser(
        currentPassword: parmas.password,
        email: parmas.email,
        newPassword: parmas.newPassword,
        bio: parmas.bio,
        profilePic: parmas.profilePic,
      );
}

class UpdateUserParams {
  UpdateUserParams({
    required this.password,
    this.fullname,
    this.email,
    this.bio,
    this.newPassword,
    this.profilePic,
  });
  UpdateUserParams.empty()
      : this(
          password: '',
          email: '',
          profilePic: File(''),
          newPassword: '',
          bio: '',
          fullname: '',
        );

  String? fullname;
  String? email;
  String password;
  String? newPassword;
  String? bio;
  File? profilePic;
}
