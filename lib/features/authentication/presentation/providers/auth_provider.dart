import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_app/core/exceptions/base_exception.dart';
import 'package:user_app/core/utils/snackbar_utils.dart';
import 'package:user_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:user_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:user_app/features/authentication/domain/usecases/login_with_phone_usecase.dart';
import 'package:user_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:user_app/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:user_app/features/authentication/presentation/pages/login_page.dart';
import 'package:user_app/features/home/presentation/pages/home_page.dart';
import 'package:user_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:user_app/features/authentication/presentation/providers/auth_state.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;
  final TextEditingController phonenumberlogincontroller =
      TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();

  @override
  AuthState build() {
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData = await LogInWithPhoneUseCase(
          repository: ref.read(authenticationRepositoryProvider))(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpVerificationPage(),
          )));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(
              repository: ref.read(authenticationRepositoryProvider))(
          state.verificationId, otp);
      Future.sync(() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          )));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await LogOutUseCase(
          repository: ref.read(authenticationRepositoryProvider))();
      Future.sync(() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInPage(),
          )));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
