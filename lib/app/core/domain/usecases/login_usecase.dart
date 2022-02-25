import 'package:cadastroprodutos/app/core/domain/entities/user_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/authenticate_erros.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginUsecase {
  Future<Either<IAuthenticateErrors, UserEntity>> call(UserEnviarEntity userEnviarEntity);
}

class LoginUsecase implements ILoginUsecase {
  final IAuthenticationRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<IAuthenticateErrors, UserEntity>> call(UserEnviarEntity userEnviarEntity) => _repository.login(userEnviarEntity);
}
