import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';
import 'package:dailypet/modules/auth/domain/interfaces/logged_user_info.dart';
import 'package:dailypet/modules/auth/domain/repositories/login_repository.dart';
import 'package:dailypet/modules/auth/infra/datasources/login_datasource.dart';

part 'login_repository_impl.g.dart';

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password}) async {
    try {
      var user = await dataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginEmail(message: 'Error login with Email'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: 'Error ao tentar recuperar usuario atual logado'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: 'Error ao tentar fazer logout'));
    }
  }
}
