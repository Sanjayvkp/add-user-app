import 'package:user_app/features/home/data/models/user_model.dart';

abstract class UserFireStoreDataSource {
  Future<void> add(UserModel model);
  Future<void> remove(String id);
  // Stream<List<UserModel>> getAll();
}
