import 'package:cadastroprodutos/app/core/domain/entities/itens_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ICreateItemUsecase {
  Future<Either<IHomeErrors, int>> call(ItensEnviarEntity itensEnviarEntity);
}

class CreateItemUsecase implements ICreateItemUsecase {
  final IHomeRepository _repository;

  CreateItemUsecase(this._repository);

  @override
  Future<Either<IHomeErrors, int>> call(ItensEnviarEntity itensEnviarEntity) =>
      _repository.createItem(itensEnviarEntity);
}
