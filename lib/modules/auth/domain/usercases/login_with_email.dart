import 'package:dailypet/modules/auth/domain/services/connectivity_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';
import 'package:dailypet/modules/auth/domain/interfaces/logged_user_info.dart';
import 'package:dailypet/modules/auth/domain/repositories/login_repository.dart';
import 'package:dailypet/modules/auth/domain/utils/login_credential.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

@Injectable(singleton: false)
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;
  final ConnectivityService service;

  LoginWithEmailImpl(this.repository, this.service);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    var result = await service.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail(message: 'Invalid Email'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: 'Invalid Password'));
    }

    return await repository.loginEmail(
      email: credential.email,
      password: credential.password,
    );
  }
}
