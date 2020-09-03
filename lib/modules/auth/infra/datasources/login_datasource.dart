import 'dart:async';

import 'package:dailypet/modules/auth/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> loginEmail({String email, String password});

  Future<UserModel> currentUser();

  Future<void> logout();
}
