import 'package:cadastroprodutos/app/core/domain/entities/user_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/errors/authenticate_erros.dart';
import 'package:cadastroprodutos/app/core/domain/repositories/authentication_repository.dart';
import 'package:cadastroprodutos/app/core/infra/datasources/authentication_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/models/user_enviar_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/base_errors/base_error.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDatasource _datasource;

  AuthenticationRepository(this._datasource);

  @override
  Future<Either<IAuthenticateErrors, UserEntity>> login(UserEnviarEntity user) async {
    try {
      final userAuthenticateModel = UserEnviarModel.fromUserEntity(user);
      final result = await _datasource.login(userAuthenticateModel);
      return Right(result);
    } on IAuthenticateErrors catch (error) {
      return Left(error);
    } catch (_) {
      return Left(NotFoundAuthenticateError(message: baseErrorMessage));
    }
  }

  @override
  Future<Either<IAuthenticateErrors, int>> saveUser(UserEnviarEntity user) async {
    try {
      final addProfileModel = UserEnviarModel.fromUserEntity(user);
      final result = await _datasource.saveUser(addProfileModel);
      return Right(result);
    } catch (_) {
      return Left(NotFoundAuthenticateError(message: 'algo errado '));
    }
  }

  @override
  Future<Either<IAuthenticateErrors, UserEntity>> checkUser(UserEnviarEntity user) async {
    try {
      final userAuthenticateModel = UserEnviarModel.fromUserEntity(user);
      final result = await _datasource.checkUser(userAuthenticateModel);
      return Right(result);
    } on IAuthenticateErrors catch (error) {
      return Left(error);
    } catch (_) {
      return Left(NotFoundAuthenticateError(message: baseErrorMessage));
    }
  }
}
