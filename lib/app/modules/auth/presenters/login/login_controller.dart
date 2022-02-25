import 'package:cadastroprodutos/app/core/domain/entities/user_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/check_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/helpers/app_routes_helper.dart';
import '../../../../shared/helpers/navigation_helper.dart';
import 'login_store.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ICheckUserUsecase checkUserUsecase;

  _LoginControllerBase(this.checkUserUsecase);

  @observable
  LoginStore loginStore = LoginStore();

  Future<void> loginUser(BuildContext context) async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    final userEnviarEntity =
        UserEnviarEntity(email: loginStore.email!, password: loginStore.password!);
    final result = await checkUserUsecase.call(userEnviarEntity);
    result.fold((left) {
     const Text('Falha');
    }, (right) {
      const SnackBar(
        content: Text('Logado com sucesso'),
      );
      NavigationHelper.pushNamedAndRemoveUntil(AppRoutesHelper.home);
    });
  }
}
