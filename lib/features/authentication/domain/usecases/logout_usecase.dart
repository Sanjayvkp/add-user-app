import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/features/authentication/domain/repository/auth_repository.dart';

final class LogOutUseCase {
  final AuthenticationRepository repository;
  LogOutUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.signOut();
    } on Exception {
      throw BaseException('cannot logout');
    }
  }
}
