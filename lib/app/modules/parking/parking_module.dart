import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'parking_page.dart';
import 'store/parking_store.dart';

class ParkingModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ParkingStore(i.get<InterfaceStorageService>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => ParkingPage()),
  ];

}