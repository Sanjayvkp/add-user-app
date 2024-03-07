import 'package:user_app/features/authentication/data/datasources/firebase_datasource.dart';
import 'package:user_app/features/authentication/domain/repository/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FireBaseAuthentication datasource;
  AuthenticationRepositoryImpl({required this.datasource});
  @override
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await datasource.loginWithPhone(phone);
  }
}
