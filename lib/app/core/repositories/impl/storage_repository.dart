import 'dart:io';

import 'package:estacionamento_joao/app/core/consts/database_consts.dart';
import 'package:estacionamento_joao/app/core/consts/project_consts.dart';
import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageRepository implements InterfaceStorageRepository{

  late Database _database;

  @override
  init() async {
    // var databasesPath = await getDatabasesPath();
    String path = 'vehicles.db';
    if (!await Directory(dirname(path)).exists()) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE $entriesTable($id INTEGER PRIMARY KEY, $slotId INTEGER, $start INTEGER, $end INTEGER)'
        );
        // this table will be used solely for quicker reference to active items
        await db.execute(
          'CREATE TABLE $activeTable($slotId INTEGER PRIMARY KEY, $start INTEGER)'
        );
        Batch batch = db.batch();
        for(int i = 0; i < parkingSlots; i++){
          batch.insert('$activeTable', {'$slotId':  i, 'start': 0});
        }
        batch.commit(noResult: true);
      }
    );
  }

  @override
  Future<List<VehicleEntryModel>> getActiveEntries() async {
    List<Map<String, dynamic>> databaseQueryResult = await _database.query(activeTable);
    List<VehicleEntryModel> activeVehicles = databaseQueryResult.map((e) => VehicleEntryModel.fromJson(e)).toList();
    return activeVehicles;
  }

  @override
  Future<List<VehicleEntryModel>> getAllEntries() async {
    List<Map<String, dynamic>> databaseQueryResult = await _database.query(entriesTable);
    List<VehicleEntryModel> vehicleEntries = databaseQueryResult.map((e) => VehicleEntryModel.fromJson(e)).toList();
    return vehicleEntries;
  }

  @override
  Future<bool> insertEntry(VehicleEntryModel model) async {
    var map = model.toJson();
    int result = await _database.insert(entriesTable, model.toJson());
    if(result != 0){
      return true;
    }
    return false;
  }
  
  @override
  Future<bool> updateEntry(VehicleEntryModel model) async {
    int result = await _database.update(entriesTable, model.toJson(), where: 'id = ?', whereArgs: [model.id]);
    if(result != 0){
      return true;
    }
    return false;
  }

  @override
  Future<void> updateActiveEntry(VehicleEntryModel model) async {
    if(model.end == null){
      //making entry active
      await _database.update(activeTable, model.toJsonActive(), where: 'slotId = ?', whereArgs: [model.slotId]);
    }
    else{
      //making entry inactive
      await _database.update(activeTable, model.toJsonActive(returnStart: false), where: 'slotId = ?', whereArgs: [model.slotId]);
    }
  }

}