import 'package:cadastroprodutos/app/core/domain/errors/home_errors.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetItensUsecase {
  Future<Either<IHomeErrors, List<Map<String, dynamic>>>> call();
}

class GetItensUsecase implements IGetItensUsecase {
  final IHomeRepository _repository;

  GetItensUsecase(this._repository);

  @override
  Future<Either<IHomeErrors, List<Map<String, dynamic>>>> call() => _repository.getItems();
}
