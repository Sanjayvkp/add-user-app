import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/repository/user_repository_impl.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';
import 'package:user_app/features/home/domain/usecases/add_user_usecase.dart';
import 'package:user_app/features/home/domain/usecases/delete_user_usecase.dart';
import 'package:user_app/features/home/domain/usecases/get_user_usecase.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  late UserRepository repository;

  @override
  void build() {}

  Future<void> addUser({
    required String name,
    required String age,
    required String id,
    required String imagePath,
  }) {
    repository = ref.read(userRepositoryProvider);
    return AddUserUseCase(repository: repository)(
        age: age, name: name, id: id, imagePath: imagePath);
  }

  Future<void> deleteUser(String id) {
    final repository = ref.read(userRepositoryProvider);
    return DeleteUserUseCase(repository: repository)(id);
  }
}

@riverpod
Stream<List<UserEntity>> getAllusers(GetAllusersRef ref) {
  final repository = ref.read(userRepositoryProvider);

  final limit = ref.read(limitProvider);
  final startAfter = ref.read(startAfterProvider);

  return GetUserUseCase(repository: repository)(
    limit: limit,
    startAfter: startAfter,
  );
}

final limitProvider = StateProvider<int>((ref) => 10); // Initial limit
final startAfterProvider = StateProvider<DocumentSnapshot?>((ref) => null);
