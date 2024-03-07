import 'package:user_app/exceptions/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  String? errorMsg;
  InvalidCredentialsException({this.errorMsg})
      : super(errorMsg ?? 'Invalid user input');
}
