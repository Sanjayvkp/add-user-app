import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/datasources/user_firestore_datasource.dart';
import 'package:user_app/features/home/data/datasources/user_firestore_datasource_impl.dart';
import 'package:user_app/features/home/data/models/user_model.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFireStoreDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});
  @override
  Future<void> addUser(UserEntity entity, String id) async {
    await dataSource.add(UserModel(
      id: entity.id,
      name: entity.name,
      age: entity.age,
    ));
  }

  @override
  Future<void> deleteUser(String id) async {
    await dataSource.remove(id);
  }

  @override
  Stream<List<UserEntity>> getAll() async* {
    final data = dataSource.getAll();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final user in docs)
          UserEntity(
            name: user.name,
            age: user.age,
            id: user.id,
          )
      ];
    }
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
      dataSource: ref.watch(userFireStoreDataSourceProvider));
}
