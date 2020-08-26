import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:dailypet/modules/authentication/domain/errors/errors.dart';
import 'package:dailypet/modules/authentication/domain/interfaces/logged_user_info.dart';
import 'package:dailypet/modules/authentication/domain/repositories/login_repository.dart';

part 'get_logged_user.g.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
