import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/core/repositories/interface_storage_repository.dart';
import 'package:estacionamento_joao/app/core/services/impl/storage_service.dart';
import 'package:estacionamento_joao/app/core/services/interface_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'storage_service_test.mocks.dart';


@GenerateMocks([InterfaceStorageRepository])
main() {
  InterfaceStorageService? service;
  MockInterfaceStorageRepository mockRepository = MockInterfaceStorageRepository();

  setUp((){
    service = StorageService(mockRepository);
  });

  group("Storage Service Tests", (){
    test('Get all entries returns a non-empty list with valid data', () async{
      when(mockRepository.getAllEntries())
        .thenAnswer(
          (_) async => [
            VehicleEntryModel(slotId: 0, start: DateTime(2020), end: DateTime(2021)),
            VehicleEntryModel(slotId: 1, start: DateTime(2020), end: DateTime(2021)),
            VehicleEntryModel(slotId: 2, start: DateTime(2020), end: DateTime(2021))
          ],
        );
      var response = await service!.getAllEntries();
      expect(response, isA<List<VehicleEntryModel>>());
      expect(response.length, isNot(equals(0)));
      expect(response[0].start, DateTime(2020));
      expect(response[1].slotId, 1);
    });

    test('Get all entries returns an empty list when receiving nothing', () async{
      when(mockRepository.getAllEntries())
        .thenAnswer(
          (_) async => [
          ],
        );
      var response = await service!.getAllEntries();
      expect(response, isA<List<VehicleEntryModel>>());
      expect(response.length, 0);
    });

    test('Get active entries returns a non-empty list with valid data', () async{
      when(mockRepository.getActiveEntries())
        .thenAnswer(
          (_) async => [
            VehicleEntryModel(slotId: 0, start: DateTime(2020), end: DateTime(2021)),
            VehicleEntryModel(slotId: 1, start: DateTime(2020), end: DateTime(2021)),
            VehicleEntryModel(slotId: 2, start: DateTime(2020), end: DateTime(2021))
          ],
        );
      var response = await service!.getActiveEntries();
      expect(response, isA<List<VehicleEntryModel>>());
      expect(response.length, isNot(equals(0)));
      expect(response[0].start, DateTime(2020));
      expect(response[1].slotId, 1);
    });

    test('Get active entries returns an empty list when receiving nothing', () async{
      when(mockRepository.getActiveEntries())
        .thenAnswer(
          (_) async => [
          ],
        );
      var response = await service!.getActiveEntries();
      expect(response, isA<List<VehicleEntryModel>>());
      expect(response.length, 0);
    });

    test('Insert entry returns true if not zero', () async{
      when(mockRepository.insertEntry(any))
        .thenAnswer(
          (_) async => 1
        );

      expect(await service!.insertEntry(VehicleEntryModel(slotId: 1)), true);
    });

    test('Insert entry returns false if zero', () async{
      when(mockRepository.insertEntry(any))
        .thenAnswer(
          (_) async => 0
        );

      expect(await service!.insertEntry(VehicleEntryModel(slotId: 1)), false);
    });

    test('Update entry returns true if true', () async{
      when(mockRepository.updateEntry(any))
        .thenAnswer(
          (_) async => true
        );

      expect(await service!.updateEntry(VehicleEntryModel(slotId: 1)), true);
    });

    test('Update entry returns false if false', () async{
      when(mockRepository.updateEntry(any))
        .thenAnswer(
          (_) async => false
        );

      expect(await service!.updateEntry(VehicleEntryModel(slotId: 1)), false);
    });

  });
}