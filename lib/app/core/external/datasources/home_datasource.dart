import 'package:cadastroprodutos/app/core/infra/datasources/home_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/models/itens_enviar_model.dart';
import 'package:cadastroprodutos/app/core/infra/models/itens_model.dart';
import 'package:cadastroprodutos/services/database_handler.dart';
import 'package:flutter/cupertino.dart';

class HomeDatasource implements IHomeDatasouce {
  DatabaseHelper con = DatabaseHelper();

  @override
  Future<int> createItem(ItensEnviarModel itensEnviarModel) async {
    var dbClient = await con.db;
    int res = await dbClient.insert('Itens', itensEnviarModel.toJson());
    return res;
  }

  @override
  Future<List<Map<String, dynamic>>> getItens() async {
    var dbClient = await con.db;
    return dbClient.query('Itens', orderBy: "id");
  }

  @override
  Future<int> updateItens(ItensModel itensModel) async {
    var dbClient = await con.db;
    final data = {
      'title': itensModel.title,
      'description': itensModel.description,
      'id': itensModel.id,
    };
    final result =await dbClient.update('Itens', data, where: "id = ?", whereArgs: [itensModel.id]);
    return result;
  }

  @override
  Future<bool> deleteItens(int id) async {
    var dbClient = await con.db;
    try {
      await dbClient.delete("Itens", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
    throw UnimplementedError();
  }
}
