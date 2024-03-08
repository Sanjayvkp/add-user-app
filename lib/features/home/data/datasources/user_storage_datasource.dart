import 'dart:io';

abstract class UserStorageDataSource {
  Future<String> add(File image, String fileName);
}
