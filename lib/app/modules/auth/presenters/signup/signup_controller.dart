import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/login_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/register_user_usecase.dart';
import 'package:cadastroprodutos/app/modules/auth/presenters/signup/signup_store.dart';
import 'package:cadastroprodutos/app/shared/helpers/app_routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/helpers/navigation_helper.dart';

part 'signup_controller.g.dart';

class SignupController = SignupControllerBase with _$SignupController;

abstract class SignupControllerBase with Store {
  final ILoginUsecase _usecase;
  final ISaveUserUsecase saveUserUsecase;

  SignupControllerBase(this._usecase, this.saveUserUsecase);

  @observable
  SignupStore signupStore = SignupStore();

  Future<void> registerUser(BuildContext context) async {
    final userEntity = UserEnviarEntity(
      email: signupStore.email!,
      password: signupStore.password!,
    );
    final result = await _usecase.call(userEntity);
    result.fold((left) {
      const SnackBar(
        content: Text('Falha'),
      );
    }, (right) async {
      const SnackBar(
        content: Text('Logado com sucesso'),
      );
      await saveUserUsecase.call(userEntity);
      NavigationHelper.navigateToReplacement(AppRoutesHelper.home);
    });
  }
}
