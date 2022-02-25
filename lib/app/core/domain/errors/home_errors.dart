import 'base_errors/base_error_interface.dart';

abstract class IHomeErrors implements IBaseError {}

class NotFoudHomeErrors implements IHomeErrors {
  @override
  String? message;

  NotFoudHomeErrors({required this.message});
}
