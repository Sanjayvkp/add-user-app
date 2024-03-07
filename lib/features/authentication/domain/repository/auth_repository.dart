abstract class AuthenticationRepository {
  Future<(String, int?)> loginWithPhone(String phone);
}
