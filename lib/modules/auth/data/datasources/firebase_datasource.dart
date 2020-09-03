import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:dailypet/modules/auth/domain/errors/errors.dart';
import 'package:dailypet/modules/auth/infra/models/user_model.dart';
import '../../infra/datasources/login_datasource.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;

  FirebaseDataSourceImpl(this.auth);

  @override
  Future<UserModel> loginEmail({String email, String password}) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    var user = result.user;
    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    var user = (await auth.currentUser);

    if (user == null) {
      throw ErrorGetLoggedUser();
    }

    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
