import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/home/data/datasources/user_firestore_datasource.dart';
import 'package:user_app/features/home/data/models/user_model.dart';

part 'user_firestore_datasource_impl.g.dart';

class UserFireStoreDataSourceImpl implements UserFireStoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('users')
      .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> add(UserModel model) async {
    await collection.doc(model.name).set(model);
  }

  @override
  Future<void> remove(String id) async {
    return await collection.doc(id).delete();
  }

  @override
  Stream<List<UserModel>> getAll() async* {
    final userStream = collection.snapshots();

    await for (final users in userStream) {
      yield [
        for (final user in users.docs) user.data(),
      ];
    }
  }
}

@riverpod
UserFireStoreDataSource userFireStoreDataSource(
    UserFireStoreDataSourceRef ref) {
  return UserFireStoreDataSourceImpl();
}
