import 'base_error_interface.dart';

const String baseErrorMessage = 'An unidentified error has occurred, please try again';

class BaseError implements IBaseError {
  @override
  String? message;

  BaseError({required this.message});
}
