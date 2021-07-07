import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final InterfaceStorageService _service;

  _HomeStoreBase(this._service){
    init();
  }
  
  @observable
  ObservableList<VehicleEntryModel> parkingSlots = ObservableList.of([]);

  @action
  Future<void> init() async {
    await _service.initDB();
    await getActiveEntries();
  }
  @action
  Future<void> getActiveEntries() async {
    var slots = await _service.getActiveEntries();
    parkingSlots = ObservableList.of(slots);
  }
  @action
  Future<void> occupySlot(VehicleEntryModel model, DateTime datetime) async{
    int id = await _service.insertEntry(model..start = datetime);
    await getActiveEntries();
  }

  @action
  Future<void> freeSlot(VehicleEntryModel model, DateTime datetime) async{
    model.active = false;
    model.end = datetime;
    await _service.updateEntry(model);
    await getActiveEntries();
  }
}