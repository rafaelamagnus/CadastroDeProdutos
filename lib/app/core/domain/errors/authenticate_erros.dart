import 'base_errors/base_error_interface.dart';

abstract class IAuthenticateErrors implements IBaseError {}

class NotFoundAuthenticateError implements IAuthenticateErrors {
  @override
  String? message;

  NotFoundAuthenticateError({required this.message});
}
