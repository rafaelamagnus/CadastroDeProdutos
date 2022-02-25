import 'package:cadastroprodutos/app/core/domain/entities/itens_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IUpdateItensUsecase {
  Future<Either<IHomeErrors, int>> call(ItensEntity itensEntity);
}

class UpdateItensUsecase implements IUpdateItensUsecase {
  final IHomeRepository _repository;

  UpdateItensUsecase(this._repository);

  @override
  Future<Either<IHomeErrors, int>> call(ItensEntity itensEntity) =>  _repository.updateItem(itensEntity);
}
