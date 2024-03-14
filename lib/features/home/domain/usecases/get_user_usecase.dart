import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/core/utils/firebase_storage_utils.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

final class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(int limit, String lastDoc) async* {
    try {
      final userStream = repository.getAll(limit, lastDoc);
      await for (final users in userStream) {
        yield [
          for (final user in users)
            UserEntity(
                name: user.name,
                age: user.age,
                id: user.id,
                imagePath:
                    await FirebaseStorageUtils.getDownloadUrl(user.imagePath))
        ];
      }
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
