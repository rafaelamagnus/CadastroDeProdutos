import 'package:cadastroprodutos/app/core/domain/repositories/home_repository.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/create_item.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/delete_item_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/get_itens_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/update_itens_usecase.dart';
import 'package:cadastroprodutos/app/core/external/datasources/home_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/datasources/home_datasource.dart';
import 'package:cadastroprodutos/app/core/infra/repositories/home_repository.dart';
import 'package:cadastroprodutos/app/modules/home/presenters/home/home_controller.dart';
import 'package:cadastroprodutos/app/modules/home/presenters/home/home_page.dart';
import 'package:cadastroprodutos/app/modules/home/presenters/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
//Controllers and Stores
Bind.lazySingleton((i) => HomeStore()),
Bind.lazySingleton((i) => HomeController(i.get<IGetItensUsecase>(),i.get<ICreateItemUsecase>(),i.get<IUpdateItensUsecase>(),i.get<IDeleteItensUsecase>())),
Bind.lazySingleton<HomeStore>((i) => HomeStore()),
Bind.lazySingleton<IGetItensUsecase>((i) => GetItensUsecase(i.get<IHomeRepository>())),
Bind.lazySingleton<ICreateItemUsecase>((i) => CreateItemUsecase(i.get<IHomeRepository>())),
Bind.lazySingleton<IUpdateItensUsecase>((i) => UpdateItensUsecase(i.get<IHomeRepository>())),
Bind.lazySingleton<IDeleteItensUsecase>((i) => DeleteItensUsecase(i.get<IHomeRepository>())),

 //Repositories
 Bind.lazySingleton<IHomeRepository>((i) => HomeRepository(i.get<IHomeDatasouce>())),

  //Datasources
  Bind.lazySingleton<IHomeDatasouce>((i) => HomeDatasource()),
 ];

 @override
 final List<ModularRoute> routes = [
 ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
 
 ];
}