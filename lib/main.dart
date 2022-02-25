import 'package:cadastroprodutos/services/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

late DatabaseHelper handler;
Future<void> main() async {
  // handler = DatabaseHelper();
  // handler.initDb();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
