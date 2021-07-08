import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:estacionamento_joao/app/modules/history/history_page.dart';
import 'package:estacionamento_joao/app/modules/history/store/history_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HistoryStore(i.get<InterfaceStorageService>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => HistoryPage()),
  ];

}