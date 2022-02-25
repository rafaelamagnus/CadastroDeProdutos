import 'package:cadastroprodutos/app/core/infra/models/itens_enviar_model.dart';
import 'package:cadastroprodutos/app/core/infra/models/itens_model.dart';

abstract class IHomeDatasouce {
  Future<int> createItem(ItensEnviarModel itensEnviarModel);
  Future<int> updateItens(ItensModel itensModel);
  Future<bool> deleteItens(int id);
  Future<List<Map<String, dynamic>>> getItens();
}
