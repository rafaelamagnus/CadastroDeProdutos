import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    refreshJournals();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Lista'),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: controller.homeStore.journals.length,
          itemBuilder: (context, index) => Card(
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            child: ListTile(
                title: Text(controller.homeStore.journals[index]['title']),
                subtitle: Text(controller.homeStore.journals[index]['description']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showForm(controller.homeStore.journals[index]['id']);
                            refreshJournals();
                          }),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            controller.deleteItem(controller.homeStore.journals[index]['id']);
                            refreshJournals();
                          }),
                    ],
                  ),
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showForm(null),
        ),
      );

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =controller.homeStore.journals.firstWhere((element) => element['id'] == id);
      controller.homeStore.title = existingJournal['title'];
      controller.homeStore.describle = existingJournal['description'];
    }
    showDialog(
      context: context,
      builder: (_) => Material(
        child: SafeArea(
          minimum: const EdgeInsets.all(50),
          child: Column(
            children: [
              Observer(builder: (_) {
                return TextFormField(
                  onChanged: controller.homeStore.setTitle,
                  readOnly: false,
                  textInputAction: TextInputAction.next,
                  initialValue: controller.homeStore.title,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return TextFormField(
                  onChanged: controller.homeStore.setDescrible,
                  readOnly: false,
                  textInputAction: TextInputAction.next,
                  initialValue: controller.homeStore.describle,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Describle',
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await controller.createItem();
                    refreshJournals();
                  }
                  if (id != null) {
                    await controller.updateItem(id);
                    refreshJournals();
                  }
                  controller.homeStore.resetData();
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  refreshJournals() async {
    final data = await controller.getItensUsecase.call();
    setState(() {
      data.fold((left) => null, (right) {
        controller.homeStore.setJournalsEntity(right);
      });
    });
  }
}
