import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

final class DeleteUserUseCase {
  final UserRepository repository;
  DeleteUserUseCase({required this.repository});
  Future<void> call(String id) async {
    try {
      await repository.deleteUser(id);
    } catch (e) {
      throw BaseException('Cannot Delete product');
    }
  }
}
