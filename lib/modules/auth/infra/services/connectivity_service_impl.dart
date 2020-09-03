import 'package:dailypet/modules/auth/domain/services/connectivity_service.dart';
import 'package:dailypet/modules/auth/infra/drivers/connectvity_driver.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/errors/errors.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await driver.isOnline;
      if (check) {
        return Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ConnectionError(
        message: 'Erro ao recuperar informação de conexão',
      ));
    }
  }
}
