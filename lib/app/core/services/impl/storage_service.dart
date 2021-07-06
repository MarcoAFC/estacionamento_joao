import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';

class StorageService implements InterfaceStorageService{
  final InterfaceStorageRepository _repository;

  StorageService(this._repository);

  @override
  Future<List<VehicleEntryModel>> getActiveEntries() {
    // TODO: implement getActiveEntries
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleEntryModel>> getAllEntries() {
    // TODO: implement getAllEntries
    throw UnimplementedError();
  }

  @override
  Future<bool> insertEntry(VehicleEntryModel model) {
    // TODO: implement insertEntry
    throw UnimplementedError();
  }
  
  @override
  Future<bool> updateEntry(VehicleEntryModel model) {
    // TODO: implement updateEntry
    throw UnimplementedError();
  }

}