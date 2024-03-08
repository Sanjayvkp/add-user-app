import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/datasources/user_storage_datasource.dart';

part 'user_storage_datasource_impl.g.dart';

class UserStorageDataSourceImpl implements UserStorageDataSource {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> add(File image, String fileName) async {
    await storageRef.child('user/$fileName').putFile(image);
    final filePath = storageRef.child('user/$fileName').fullPath;
    return filePath;
  }
}

@riverpod
UserStorageDataSource userStorageDataSource(UserStorageDataSourceRef ref) {
  return UserStorageDataSourceImpl();
}
