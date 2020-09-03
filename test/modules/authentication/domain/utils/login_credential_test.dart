import 'package:dailypet/modules/auth/domain/utils/login_credential.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('should check if field is valid or not', () {
    test('email and password', () {
      expect(
        LoginCredential.withEmailAndPassword(email: '', password: '')
            .isValidEmail,
        false,
      );
      expect(
        LoginCredential.withEmailAndPassword(email: 'jacob', password: '')
            .isValidEmail,
        false,
      );
      expect(
        LoginCredential.withEmailAndPassword(
                email: 'jacob@flutterrando.com.br', password: '')
            .isValidEmail,
        true,
      );
    });
  });
}
