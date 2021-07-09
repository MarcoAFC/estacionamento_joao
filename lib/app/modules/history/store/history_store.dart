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

  List<VehicleEntryModel> allEntries = [];

  @action
  init() async {
    allEntries = await _service.getAllEntries();
    entries = ObservableList.of(allEntries);
    manageEntries();
  }

  @observable
  bool showActive = true;

  @action
  void setShowActive(){
    showActive = !showActive;
    manageEntries();
  }

  @observable
  bool showInactive = true;

  @action
  void setShowInactive(){
    showInactive = !showInactive;
    manageEntries();
  }

  @action
  void manageEntries(){
    entries.clear();
    if(showActive){
      entries.addAll(allEntries.where((element) => element.active));
    }
    if(showInactive){
      entries.addAll(allEntries.where((element) => !element.active));
    }
    entries.sort(
      (first, second){
        return second.start!.compareTo(first.start?? DateTime.now());
      }
    );
  }
}