import 'package:cadastroprodutos/app/core/infra/datasources/authentication_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/models/user_enviar_model.dart';
import 'package:cadastroprodutos/app/core/infra/models/user_model.dart';
import 'package:cadastroprodutos/services/database_handler.dart';

class AuthenticationDatasource implements IAuthenticationDatasource {
  DatabaseHelper con = DatabaseHelper();

  @override
  Future<int> saveUser(UserEnviarModel userEnviarModel) async {
    var dbClient = await con.db;
    int res = await dbClient.insert('User', userEnviarModel.toJson());
    return res;
  }

  @override
  Future<UserModel> login(UserEnviarModel userEnviarModel) async {
   return  Future.value( UserModel(email: userEnviarModel.email, password: userEnviarModel.password));
  }

  @override
  Future<UserModel> checkUser(UserEnviarModel userEnviarModel) async {
    var dbClient = await con.db;
    List<Map<String, dynamic>> res = await dbClient.query("User",where: '"email" = ? and "password"=?', whereArgs: [userEnviarModel.email,userEnviarModel.password]);
    for (var row in res) {
      return Future<UserModel>.value(UserModel.fromJson(row));
    }
    return Future<UserModel>.error("Unable to find User");
  }
}
