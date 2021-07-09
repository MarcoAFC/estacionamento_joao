import 'package:estacionamento_joao/app/modules/history/history_module.dart';
import 'package:estacionamento_joao/app/modules/home/home_page.dart';
import 'package:estacionamento_joao/app/modules/home/stores/home_store.dart';
import 'package:estacionamento_joao/app/modules/parking/parking_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  
  @override
  List<Bind> get binds => [
    Bind((i) => HomeStore())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      '/', 
      child: (_, args) => HomePage(),
      children: [
        ModuleRoute('/history', module: HistoryModule()),
        ModuleRoute('/parking', module: ParkingModule())
      ]
    ),
    
  ];

}