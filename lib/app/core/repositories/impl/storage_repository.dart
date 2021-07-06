import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:sqflite/sqflite.dart';

class StorageRepository implements InterfaceStorageRepository{

  late Database _database;

  StorageRepository(){
    init();
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'vehicles.db';

    await deleteDatabase(path);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE VehicleEntries(id INTEGER PRIMARY KEY, slotId INTEGER, start INTEGER, end INTEGER)'
        );
        // this table will be used solely for quicker reference to active items
        await db.execute(
          'CREATE TABLE ActiveVehicles(slotId INTEGER PRIMARY KEY, start INTEGER)'
        );
      });
  }

  @override
  Future<List<VehicleEntryModel>> getActiveEntries() async {
    List<Map<String, dynamic>> databaseQueryResult = await _database.query('ActiveVehicles');
    List<VehicleEntryModel> activeVehicles = databaseQueryResult.map((e) => VehicleEntryModel.fromJson(e)).toList();
    return activeVehicles;
  }

  @override
  Future<List<VehicleEntryModel>> getAllEntries() async {
    List<Map<String, dynamic>> databaseQueryResult = await _database.query('VehicleEntries');
    List<VehicleEntryModel> vehicleEntries = databaseQueryResult.map((e) => VehicleEntryModel.fromJson(e)).toList();
    return vehicleEntries;
  }

  @override
  Future<bool> insertEntry(VehicleEntryModel model) async {
    int result = await _database.insert('vehicleEntries', model.toJson());
    if(result != 0){
      return true;
    }
    return false;
  }
  
  @override
  Future<bool> updateEntry(VehicleEntryModel model) async {
    int result = await _database.update('vehicleEntries', model.toJson(), where: 'id = ?', whereArgs: [model.id]);
    if(result != 0){
      return true;
    }
    return false;
  }

}