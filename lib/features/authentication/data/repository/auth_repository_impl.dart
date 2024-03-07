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

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await datasource.verifyOtp(verificationId, otp);
  }

  @override
  Future<void> signOut() async {
    await datasource.signout();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      datasource: ref.watch(firebaseAuthenticationProvider));
}
