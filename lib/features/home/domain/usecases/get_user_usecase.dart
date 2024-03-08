import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

final class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  Stream<List<UserEntity>> call() async* {
    try {
      final userStream = repository.getAll();
      await for (final users in userStream) {
        yield [
          for (final user in users)
            UserEntity(
              name: user.name,
              age: user.age,
              id: user.id,
            )
        ];
      }
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
