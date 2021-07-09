import 'package:estacionamento_joao/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/repositories/impl/storage_repository.dart';
import 'core/repositories/interface_storage_repository.dart';
import 'core/services/impl/storage_service.dart';


class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind.singleton((i) => StorageRepository()),
    Bind.singleton((i) => StorageService(i.get<InterfaceStorageRepository>())),
    Bind.singleton((i) => GlobalKey<ScaffoldState>())
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];

}