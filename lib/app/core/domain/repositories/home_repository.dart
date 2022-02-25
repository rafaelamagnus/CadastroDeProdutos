import 'package:cadastroprodutos/app/core/domain/entities/itens_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/itens_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<IHomeErrors, int>> createItem(ItensEnviarEntity itens);
  Future<Either<IHomeErrors,int>>updateItem(ItensEntity itensEntity);
  Future<Either<IHomeErrors,bool>>deleteItem(int id);
  Future<Either<IHomeErrors,List<Map<String, dynamic>>>> getItems();
}
