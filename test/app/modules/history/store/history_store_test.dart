
import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:estacionamento_joao/app/modules/history/store/history_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'history_store_test.mocks.dart';

@GenerateMocks([InterfaceStorageService])
main(){
  MockInterfaceStorageService mockService = MockInterfaceStorageService();

  HistoryStore? store;
  var date = DateTime(2021);
  setUp((){
    when(mockService.getAllEntries()).thenAnswer((_) async => 
      [
        VehicleEntryModel(slotId: 0, start: date, end: date),
        VehicleEntryModel(slotId: 1, start: date, end: date),
        VehicleEntryModel(slotId: 2, start: date, active: true,),
        VehicleEntryModel(slotId: 3, start: date, active: true,)
      ]
    );
    store = HistoryStore(mockService);
  });

  group('History Store tests',(){

    test('History Store has valid allEntries on start',() async {
      store = HistoryStore(mockService);
      await store!.init();
      expect(store!.allEntries.length, 4);
      expect(store!.allEntries[2].slotId, 2);
      expect(store!.allEntries[3].active, true);
    });

    test('History Store allEntries and entries have the same values on start',() async {
      store = HistoryStore(mockService);
      await store!.init();
      expect(store!.entries.contains(store!.allEntries[0]), true);
      expect(store!.entries.contains(store!.allEntries[1]), true);
      expect(store!.entries.contains(store!.allEntries[2]), true);
      expect(store!.entries.contains(store!.allEntries[3]), true);
    });

    test('History Store allEntries and entries have different values after hiding active',() async {
      store = HistoryStore(mockService);
      await store!.init();
      store!.setShowActive();
      expect(store!.entries.contains(store!.allEntries[0]), true);
      expect(store!.entries.contains(store!.allEntries[1]), true);
      expect(store!.entries.contains(store!.allEntries[2]), false);
      expect(store!.entries.contains(store!.allEntries[3]), false);
    });

    test('History Store allEntries and entries have different values after hiding inactive',() async {
      store = HistoryStore(mockService);
      await store!.init();
      store!.setShowInactive();
      expect(store!.entries.contains(store!.allEntries[0]), false);
      expect(store!.entries.contains(store!.allEntries[1]), false);
      expect(store!.entries.contains(store!.allEntries[2]), true);
      expect(store!.entries.contains(store!.allEntries[3]), true);
    });

    test('History Store allEntries and entries have no common values after hiding both',() async {
      store = HistoryStore(mockService);
      await store!.init();
      store!.setShowActive();
      store!.setShowInactive();
      expect(store!.entries.contains(store!.allEntries[0]), false);
      expect(store!.entries.contains(store!.allEntries[1]), false);
      expect(store!.entries.contains(store!.allEntries[2]), false);
      expect(store!.entries.contains(store!.allEntries[3]), false);
    });

    test('History Store entries is empty after hiding both',() async {
      store = HistoryStore(mockService);
      await store!.init();
      store!.setShowActive();
      store!.setShowInactive();
      expect(store!.entries.isEmpty, true);
    });
    
  });

}