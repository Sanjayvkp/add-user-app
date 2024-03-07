import 'package:user_app/core/exceptions/authentication/invalid_credential_exception.dart';
import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/features/authentication/domain/repository/auth_repository.dart';

final class LogInWithPhoneUseCase {
  final AuthenticationRepository repository;
  LogInWithPhoneUseCase({required this.repository});

  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter Phone number correctly');
    }
  }
}
