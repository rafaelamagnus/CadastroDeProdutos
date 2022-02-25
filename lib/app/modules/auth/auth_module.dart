import 'package:cadastroprodutos/app/core/domain/repositories/authentication_repository.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/check_user_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/login_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/register_user_usecase.dart';
import 'package:cadastroprodutos/app/modules/auth/presenters/auth/auth_controller.dart';
import 'package:cadastroprodutos/app/modules/auth/presenters/login/login_controller.dart';
import 'package:cadastroprodutos/app/modules/auth/presenters/signup/signup_controller.dart';
import 'package:cadastroprodutos/app/modules/auth/presenters/signup/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/helpers/app_routes_helper.dart';
import 'presenters/auth/auth_page.dart';
import 'presenters/login/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthController()),
        Bind.lazySingleton((i) => LoginController(i.get<ICheckUserUsecase>())),
        Bind.lazySingleton((i) => SignupController(i.get<ILoginUsecase>(),i.get<ISaveUserUsecase>())),
        Bind.lazySingleton<ILoginUsecase>((i) => LoginUsecase(i.get<IAuthenticationRepository>())),
        Bind.lazySingleton<ICheckUserUsecase>((i) => CheckUserUsecase(i.get<IAuthenticationRepository>())),
        Bind.lazySingleton<ISaveUserUsecase>((i) => SaveUserUsecase(i.get<IAuthenticationRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const AuthPage()),
        ChildRoute(AppRoutesHelper.authSignup, child: (_, args) => const SignupPage()),
        ChildRoute(AppRoutesHelper.authLogin, child: (_, args) => const LoginPage()),
        
      ];
}
