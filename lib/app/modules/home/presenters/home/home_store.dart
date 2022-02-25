import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<Map<String, dynamic>> journals = [];

  @observable
  String? title;

  @observable
  String? describle;

  @action
  void setTitle(String value) => title = value;

  @action
  void setDescrible(String value) => describle = value;

  @action
  void setJournalsEntity(List<Map<String, dynamic>> value) => journals = value;

  @action
  void resetData() {
    title = null;
    describle = null;
  }
}
