import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity entity, String id);
  Future<void> deleteUser(String id);
  Stream<List<UserEntity>> getAll(
      {int limit = 10, DocumentSnapshot? startAfter});
  Future<String> upload(File fileToUpload, String filePath);
}
