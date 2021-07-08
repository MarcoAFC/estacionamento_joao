import 'package:estacionamento_joao/app/core/repositories/impl/storage_repository.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:estacionamento_joao/app/core/services/impl/storage_service.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:estacionamento_joao/app/modules/history/history_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'store/parking_store.dart';

class ParkingModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => StorageRepository()),
    Bind((i) => StorageService(i.get<InterfaceStorageRepository>())),
    Bind((i) => ParkingStore(i.get<InterfaceStorageService>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => ParkingPage()),
    ModuleRoute('/history', module: HistoryModule())
  ];

}