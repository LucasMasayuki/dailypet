import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';
import 'package:dailypet/modules/auth/domain/interfaces/logged_user_info.dart';
import 'package:dailypet/modules/auth/infra/datasources/login_datasource.dart';
import 'package:dailypet/modules/auth/infra/models/user_model.dart';
import 'package:dailypet/modules/auth/infra/repositories/login_repository_impl.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

main() {
  final datasource = LoginDataSourceMock();
  final userReturn = UserModel(
    name: 'Lucas',
    email: 'lucas@gmail.com',
    phoneNumber: '1234567',
  );
  final repository = LoginRepositoryImpl(datasource);

  group('loginEmail', () {
    test('should get UserModel', () async {
      when(datasource.loginEmail()).thenAnswer((_) async => userReturn);
      var result = await repository.loginEmail();
      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
    });
    test('should call ErrorLoginEmail', () async {
      when(datasource.loginEmail()).thenThrow(ErrorLoginEmail());
      var result = await repository.loginEmail();
      expect(result.leftMap((l) => l is ErrorLoginEmail), Left(true));
    });
  });

  group('loggedUser', () {
    test('should get Current User Logged', () async {
      when(datasource.currentUser()).thenAnswer((_) async => userReturn);
      var result = await repository.loggedUser();
      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
    });
    test('should Throw when user not logged', () async {
      when(datasource.currentUser()).thenThrow(ErrorGetLoggedUser());
      var result = await repository.loggedUser();
      expect(result.leftMap((l) => l is ErrorGetLoggedUser), Left(true));
    });
  });
  group('logout', () {
    test('should get logout', () async {
      when(datasource.logout()).thenAnswer((_) async {});
      var result = await repository.logout();
      expect(result, isA<Right<dynamic, Unit>>());
    });
    test('should Throw when user try logout', () async {
      when(datasource.logout()).thenThrow(ErrorGetLoggedUser());
      var result = await repository.logout();
      expect(result.leftMap((l) => l is ErrorLogout), Left(true));
    });
  });
}
