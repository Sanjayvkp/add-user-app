import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

final class AddUserUseCase {
  final UserRepository repository;
  AddUserUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String name,
    required String age,
  }) async {
    try {
      await repository.addUser(
        UserEntity(
          name: name,
          age: age,
          id: id,
        ),
        id,
      );
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
