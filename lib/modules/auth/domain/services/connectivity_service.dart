import 'package:dartz/dartz.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
