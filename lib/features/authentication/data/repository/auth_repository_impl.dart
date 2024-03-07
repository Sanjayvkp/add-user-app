import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/features/authentication/data/datasources/firebase_datasource.dart';
import 'package:user_app/features/authentication/data/datasources/firebase_datasource_impl.dart';
import 'package:user_app/features/authentication/domain/repository/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FireBaseAuthentication datasource;
  AuthenticationRepositoryImpl({required this.datasource});
  @override
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await datasource.loginWithPhone(phone);
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      datasource: ref.watch(firebaseAuthenticationProvider));
}
