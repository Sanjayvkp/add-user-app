import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/repository/user_repository_impl.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';
import 'package:user_app/features/home/domain/usecases/add_user_usecase.dart';
import 'package:user_app/features/home/domain/usecases/delete_user_usecase.dart';
import 'package:user_app/features/home/domain/usecases/get_user_usecase.dart';

part 'user_provider.g.dart';
part 'user_provider.freezed.dart';

@freezed
class UserProviderState with _$UserProviderState {
  factory UserProviderState({
    required List<UserEntity>? users,
    required bool isLoading,
  }) = _UserProviderState;
}

@Riverpod(keepAlive: true)
class User extends _$User {
  late UserRepository repository;

  @override
  UserProviderState build() {
    ref.read(getAllusersProvider(10, ''));

    return UserProviderState(isLoading: false, users: null);
  }

  /// Updatet the users list
  void updateUsersList(List<UserEntity> newUsers) {
    state = state.copyWith(users: [...newUsers], isLoading: false);
  }

  /// Change loading
  void changeLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

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
Stream<List<UserEntity>> getAllusers(
    GetAllusersRef ref, int limit, String lastDoc) {
  final repository = ref.read(userRepositoryProvider);
  final stream = GetUserUseCase(repository: repository)(limit, lastDoc);

  stream.listen((newUsers) {
    final currentUsers = <UserEntity>[...(ref.read(userProvider).users ?? [])];
    currentUsers.removeWhere((element) => newUsers.contains(element));

    final sortedUsers = currentUsers
      ..addAll(newUsers)
      ..sort((a, b) => a.name.compareTo(b.name));

    ref.read(userProvider.notifier).updateUsersList(sortedUsers);
  });

  return stream;
}
