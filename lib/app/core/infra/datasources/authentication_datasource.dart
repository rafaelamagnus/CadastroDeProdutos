import 'package:cadastroprodutos/app/core/infra/models/user_enviar_model.dart';
import 'package:cadastroprodutos/app/core/infra/models/user_model.dart';

abstract class IAuthenticationDatasource {
  Future<int> saveUser(UserEnviarModel userEnviarModel);
  Future<UserModel> login(UserEnviarModel userEnviarModel);
  Future<UserModel> checkUser(UserEnviarModel userEnviarModel);
}
