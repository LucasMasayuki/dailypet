import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dailypet/modules/auth/data/datasources/firebase_datasource.dart';
import 'package:dailypet/modules/auth/domain/entities/logged_user.dart';
import 'package:dailypet/modules/auth/domain/errors/errors.dart';

class FirebaseUserMock extends Mock implements User {}

class AuthResultMock extends Mock implements UserCredential {}

class AuthCredentialMock extends Mock implements AuthCredential {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

final credential = AuthCredentialMock();

main() {
  final auth = FirebaseAuthMock();
  final firebaseUser = FirebaseUserMock();
  final user = const LoggedUser(
    name: 'Jacob',
    phoneNumber: '123456',
    email: 'jacob@flutterando.com',
  );

  final authResult = AuthResultMock();
  final datasource = FirebaseDataSourceImpl(auth);

  setUpAll(() {
    when(firebaseUser.displayName).thenReturn('Jacob');
    when(firebaseUser.email).thenReturn('jacob@flutterando.com');
    when(firebaseUser.phoneNumber).thenReturn('123456');
    when(authResult.user).thenReturn(firebaseUser);

    when(auth.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => authResult);

    when(auth.signInWithCredential(any)).thenAnswer((_) async => authResult);
  });

  test('should return Logged User  loginEmail', () async {
    var result = await datasource.loginEmail();
    expect(result.name, equals(user.name));
    expect(result.phoneNumber, equals(user.phoneNumber));
    expect(result.email, equals(user.email));
  });

  test('should return ErrorGetLoggedUser if User is not logged', () async {
    expect(datasource.currentUser(), throwsA(isA<ErrorGetLoggedUser>()));
  });

  test('should complete logout', () async {
    when(auth.signOut()).thenAnswer((_) async {});
    expect(datasource.logout(), completes);
  });

  test('should return error', () async {
    when(auth.signOut()).thenThrow(Exception());
    expect(datasource.logout(), throwsA(isA<Exception>()));
  });
}
