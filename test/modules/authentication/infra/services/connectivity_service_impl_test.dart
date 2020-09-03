import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';
import 'package:dailypet/modules/auth/infra/drivers/connectvity_driver.dart';
import 'package:dailypet/modules/auth/infra/services/connectivity_service_impl.dart';

class ConnectivityDriverMock extends Mock implements ConnectivityDriver {}

main() {
  final driver = ConnectivityDriverMock();
  final service = ConnectivityServiceImpl(driver);

  group('ConnectivityServiceImpl', () {
    test('should return bool', () async {
      when(driver.isOnline).thenAnswer((_) async => true);
      var result = await service.isOnline();
      expect(result, isA<Right<dynamic, bool>>());
    });
    test('should call ErrorLoginEmail', () async {
      when(service.isOnline()).thenThrow(ConnectionError());
      var result = await service.isOnline();
      expect(result.leftMap((l) => l is ConnectionError), Left(true));
    });
  });
}
