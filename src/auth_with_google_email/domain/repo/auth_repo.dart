import 'dart:io';

import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  FutureResult<LocalUser> signIn({
    required String email,
    required String password,
  });

  FutureResult<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  FutureResult<void> forgetPassword(String email);

  FutureResult<void> updateUser({
    required String currentPassword,
    String? fullName,
    String? email,
    String? newPassword,
    String? bio,
    File? profilePic,
  });

  FutureResult<LocalUser> getUserData();
}
