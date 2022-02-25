import 'package:cadastroprodutos/app/shared/helpers/app_routes_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/domain/repositories/authentication_repository.dart';
import 'core/external/datasources/authentication_datasource.dart';
import 'core/infra/datasources/authentication_datasource.dart';
import 'core/infra/repositories/authentication_repository.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Repositories
    Bind.lazySingleton<IAuthenticationRepository>((i) => AuthenticationRepository(i.get<IAuthenticationDatasource>())),

    //Datasources
    Bind.lazySingleton<IAuthenticationDatasource>((i) => AuthenticationDatasource()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute(AppRoutesHelper.home, module: HomeModule()),
  ];
}
