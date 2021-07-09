
import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:estacionamento_joao/app/modules/parking/store/parking_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parking_store_test.mocks.dart';

@GenerateMocks([InterfaceStorageService])
main(){
  ParkingStore? parkingStore;
  MockInterfaceStorageService mockService = MockInterfaceStorageService();
  var date = DateTime(2021);
  setUp((){
    when(mockService.getActiveEntries()).thenAnswer(
        (_) async => <VehicleEntryModel>[
          VehicleEntryModel(slotId: 0),
          VehicleEntryModel(slotId: 1),
          VehicleEntryModel(slotId: 2, start: date, active: true,),
        ]
      );
    parkingStore = ParkingStore(mockService);
  });
  group('Parking Store tests', (){
    test('Parking Store set slot handled state sets state properly', () async {
      
      await parkingStore!.init();

      expect(parkingStore!.parkingSlots[1].beingHandled, false);

      parkingStore!.setSlotHandledState(1, true);

      expect(parkingStore!.parkingSlots[1].beingHandled, true);

    });
  });
}