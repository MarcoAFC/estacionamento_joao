import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';

abstract class InterfaceStorageService{
  Future<List<VehicleEntryModel>> getAllEntries();
  Future<List<VehicleEntryModel>> getActiveEntries();
  Future<bool> insertEntry(VehicleEntryModel model);
  Future<bool> updateEntry(VehicleEntryModel model);
}