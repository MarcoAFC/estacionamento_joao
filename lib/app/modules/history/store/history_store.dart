import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:mobx/mobx.dart';
part 'history_store.g.dart';

class HistoryStore = _HistoryStoreBase with _$HistoryStore;

abstract class _HistoryStoreBase with Store {
  final InterfaceStorageService _service;
  
  _HistoryStoreBase(this._service){
    init();
  }

  @observable
  ObservableList<VehicleEntryModel> entries = ObservableList.of([]);


  @action
  init() async {
    entries = ObservableList.of(await _service.getAllEntries());
  }


}