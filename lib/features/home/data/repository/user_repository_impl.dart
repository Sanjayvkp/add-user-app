import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/datasources/user_firestore_datasource.dart';
import 'package:user_app/features/home/data/datasources/user_firestore_datasource_impl.dart';
import 'package:user_app/features/home/data/datasources/user_storage_datasource.dart';
import 'package:user_app/features/home/data/datasources/user_storage_datasource_impl.dart';
import 'package:user_app/features/home/data/models/user_model.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/domain/repository/user_repository.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFireStoreDataSource dataSource;
  final UserStorageDataSource storageDataSource;
  UserRepositoryImpl({
    required this.dataSource,
    required this.storageDataSource,
  });
  @override
  Future<void> addUser(UserEntity entity, String id) async {
    await dataSource.add(UserModel(
      imagePath: entity.imagePath,
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
  Stream<List<UserEntity>> getAll(
      {int limit = 10, DocumentSnapshot? startAfter}) async* {
    final data = dataSource.getAll(limit: limit, startAfter: startAfter);
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final user in docs)
          UserEntity(
            imagePath: user.imagePath,
            name: user.name,
            age: user.age,
            id: user.id,
          )
      ];
    }
  }

  @override
  Future<String> upload(File fileToUpload, String filePath) {
    return storageDataSource.add(fileToUpload, filePath);
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
      storageDataSource: ref.watch(userStorageDataSourceProvider),
      dataSource: ref.watch(userFireStoreDataSourceProvider));
}
