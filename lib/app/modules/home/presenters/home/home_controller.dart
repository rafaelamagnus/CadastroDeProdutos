import 'package:cadastroprodutos/app/core/domain/entities/itens_entity.dart';
import 'package:cadastroprodutos/app/core/domain/entities/itens_enviar_entity.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/create_item.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/delete_item_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/get_itens_usecase.dart';
import 'package:cadastroprodutos/app/core/domain/usecases/update_itens_usecase.dart';
import 'package:cadastroprodutos/app/modules/home/presenters/home/home_store.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetItensUsecase getItensUsecase;
  final ICreateItemUsecase createItemUsecase;
  final IUpdateItensUsecase updateItensUsecase;
  final IDeleteItensUsecase deleteItensUsecase;
  final HomeStore homeStore = HomeStore();

  _HomeControllerBase(this.getItensUsecase, this.createItemUsecase, this.updateItensUsecase,
      this.deleteItensUsecase);

  Future<void> createItem() async {
    final item =ItensEnviarEntity(
      title: homeStore.title ?? '', 
      description: homeStore.describle ?? '');
    await createItemUsecase.call(item);
  }

  Future<void> updateItem(int id) async {
    final item =ItensEntity(
      id: id, title: homeStore.title ?? '',
      description: homeStore.describle ?? '');
    await updateItensUsecase.call(item);
  }

  void deleteItem(int? id) async {
    await deleteItensUsecase.call(id!);
  }
}
