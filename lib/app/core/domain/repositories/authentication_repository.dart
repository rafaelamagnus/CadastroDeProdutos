import 'package:cadastroprodutos/app/core/domain/entities/user_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:cadastroprodutos/app/core/domain/errors/authenticate_erros.dart';

abstract class IAuthenticationRepository {
  Future<Either<IAuthenticateErrors, int>> saveUser(UserEnviarEntity user);
  Future<Either<IAuthenticateErrors, UserEntity>> login(UserEnviarEntity user);
  Future<Either<IAuthenticateErrors, UserEntity>> checkUser(UserEnviarEntity user);
}
