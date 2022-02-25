import 'package:cadastroprodutos/app/core/domain/entities/itens_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/itens_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:cadastroprodutos/app/core/infra/datasources/home_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/models/itens_enviar_model.dart';
import 'package:cadastroprodutos/app/core/infra/models/itens_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasouce _datasource;

  HomeRepository(this._datasource);

  @override
  Future<Either<IHomeErrors, int>> createItem(ItensEnviarEntity itens) async {
    try {
      final addItem = ItensEnviarModel.fromUserEntity(itens);
      final result = await _datasource.createItem(addItem);
      return Right(result);
    } catch (_) {
      return Left(NotFoudHomeErrors(message: 'algo errado '));
    }
  }

  @override
  Future<Either<IHomeErrors, List<Map<String, dynamic>>>> getItems() async {
    try {
      final itens = await _datasource.getItens();
      return Right(itens);
    } on IHomeErrors catch (error) {
      return Left(error);
    } catch (_) {
      return Left(NotFoudHomeErrors(message: 'algo errado '));
    }
  }

  @override
  Future<Either<IHomeErrors, int>> updateItem(ItensEntity itensEntity) async{
   try {
      final addItem = ItensModel.fromUserEntity(itensEntity);
      final result = await _datasource.updateItens(addItem);
      return Right(result);
    } catch (_) {
      return Left(NotFoudHomeErrors(message: 'algo errado '));
    }
  }

  @override
  Future<Either<IHomeErrors, bool>> deleteItem(int id)async {
    try {
      final result = await _datasource.deleteItens(id);
      return Right(result);
    } catch (_) {
      return Left(NotFoudHomeErrors(message: 'algo errado '));
    }
  }
}
