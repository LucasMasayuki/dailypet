import 'package:dartz/dartz.dart';
import 'package:dailypet/modules/authentication/domain/interfaces/logged_user_info.dart';
import 'package:dailypet/modules/authentication/domain/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail({
    String email,
    String password,
  });

  Future<Either<Failure, LoggedUserInfo>> loginPhone({String phone});

  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode({
    String verificationId,
    String code,
  });

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
