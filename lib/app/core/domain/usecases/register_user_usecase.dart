import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/authenticate_erros.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ISaveUserUsecase {
  Future<Either<IAuthenticateErrors, int>> call( UserEnviarEntity userEnviarEntity);
}

class SaveUserUsecase implements ISaveUserUsecase {
  final IAuthenticationRepository _repository;

  SaveUserUsecase(this._repository);

  @override
  Future<Either<IAuthenticateErrors, int>> call(UserEnviarEntity userEnviarEntity) => _repository.saveUser(userEnviarEntity);
}
