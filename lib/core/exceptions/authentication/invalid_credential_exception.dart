import 'package:user_app/core/exceptions/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  String? errorMsg;
  InvalidCredentialsException({this.errorMsg})
      : super(errorMsg ?? 'Invalid number');
}
