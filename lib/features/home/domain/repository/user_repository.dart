import 'dart:io';
import 'package:user_app/features/home/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity entity, String id);
  Future<void> deleteUser(String id);
  Stream<List<UserEntity>> getAll(int limit, String lastDoc);
  Future<String> upload(File fileToUpload, String filePath);
}
