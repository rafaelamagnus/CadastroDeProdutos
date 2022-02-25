import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? email;

  @observable
  String? password;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;
}
