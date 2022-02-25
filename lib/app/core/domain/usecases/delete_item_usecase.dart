import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IDeleteItensUsecase {
  Future<Either<IHomeErrors, bool>> call(int id);
}

class DeleteItensUsecase implements IDeleteItensUsecase {
  final IHomeRepository _repository;

  DeleteItensUsecase(this._repository);

  @override
  Future<Either<IHomeErrors, bool>> call(int id) => _repository.deleteItem(id);
}
