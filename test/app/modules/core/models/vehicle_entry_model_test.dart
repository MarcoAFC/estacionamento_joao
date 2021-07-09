import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter_test/flutter_test.dart';

main(){

  var json = <String, dynamic>{};
  group('Vehicle Entry Model from Json tests', (){
    test('Vehicle Entry Model from Json returns null start if value is 0', (){
      json = {
        'slotId': 0,
        'start' : 0
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.start, null);
    });

    test('Vehicle Entry Model from Json returns null end if value is 0', (){
      json = {
        'slotId': 0,
        'end': 0
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.end, null);
    });

    test('Vehicle Entry Model from Json returns null start if value is null', (){
      json = {
        'slotId': 0,
        'start' : null
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.start, null);
    });

    test('Vehicle Entry Model from Json returns null end if value is null', (){
      json = {
        'slotId': 0,
        'end': null
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.end, null);
    });

    test('Vehicle Entry Model from Json returns valid start value if value is valid', (){
      json = {
        'slotId': 0,
        'start' : DateTime(2021).millisecondsSinceEpoch
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.start, DateTime(2021));
    });

    test('Vehicle Entry Model from Json returns valid end value if value is valid', (){
      json = {
        'slotId': 0,
        'end':  DateTime(2021).millisecondsSinceEpoch
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.end, DateTime(2021));
    });

    test('Vehicle Entry Model from Json returns true for active if start is valid and end isn\'t', (){
      json = {
        'slotId': 0,
        'start': DateTime(2021).millisecondsSinceEpoch,
        'end':  0
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.active, true);
    });

    test('Vehicle Entry Model from Json returns false for active if start and end are valid', (){
      json = {
        'slotId': 0,
        'start': DateTime(2021).millisecondsSinceEpoch,
        'end':  DateTime(2021).millisecondsSinceEpoch
      };

      var model = VehicleEntryModel.fromJson(json);

      expect(model.active, false);
    });

  });

  VehicleEntryModel model;

  group('Vehicle Entry Model to Json tests', (){
    test('Vehicle Entry Model to Json returns 0 for start if start is null', (){
      model = VehicleEntryModel(slotId: 1);

      var json = model.toJson();

      expect(json['start'], 0);
    });

    test('Vehicle Entry Model to Json returns 0 for end if end is null', (){
      model = VehicleEntryModel(slotId: 1);

      var json = model.toJson();

      expect(json['end'], 0);
    });

    test('Vehicle Entry Model to Json returns valid value for start if start is not null', (){
      var time = DateTime(2021);
      model = VehicleEntryModel(
        slotId: 1,
        start: time
      );

      var json = model.toJson();

      expect(json['start'], time.millisecondsSinceEpoch);
    });

    test('Vehicle Entry Model to Json returns valid value for end if end is not null', (){
      var time = DateTime(2021);
      model = VehicleEntryModel(
        slotId: 1,
        end: time
      );

      var json = model.toJson();

      expect(json['end'], time.millisecondsSinceEpoch);
    });

    test('Vehicle Entry Model to Json Active returns 0 for start if start is null', (){
      model = VehicleEntryModel(slotId: 1);

      var json = model.toJsonActive();

      expect(json['start'], 0);
    });


    test('Vehicle Entry Model to Json Active returns valid value for start if start is not null', (){
      var time = DateTime(2021);
      model = VehicleEntryModel(
        slotId: 1,
        start: time
      );

      var json = model.toJsonActive();

      expect(json['start'], time.millisecondsSinceEpoch);
    });

    test('Vehicle Entry Model to Json Active returns null for start if returnStart is false', (){
      var time = DateTime(2021);
      model = VehicleEntryModel(
        slotId: 1,
        start: time
      );

      var json = model.toJsonActive(returnStart: false);

      expect(json['start'], time.millisecondsSinceEpoch);
    });
  });
}