import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';

class StorageService implements InterfaceStorageService{
  final InterfaceStorageRepository _repository;

  StorageService(this._repository);

  @override
  Future<List<VehicleEntryModel>> getActiveEntries() => _repository.getActiveEntries();

  @override
  Future<List<VehicleEntryModel>> getAllEntries() => _repository.getAllEntries();

  @override
  Future<int> insertEntry(VehicleEntryModel model) async {
    var id = await _repository.insertEntry(model);
    model.id = id;
    await _repository.updateActiveEntry(model);
    return id;
  }
  
  @override
  Future<bool> updateEntry(VehicleEntryModel model) async {
    var response = await _repository.updateEntry(model);
    await _repository.updateActiveEntry(model);
    return response;
  }

  @override
  Future<void> initDB() => _repository.init();

}