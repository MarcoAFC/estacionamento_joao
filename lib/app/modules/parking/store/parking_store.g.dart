// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParkingStore on _ParkingStoreBase, Store {
  final _$parkingSlotsAtom = Atom(name: '_ParkingStoreBase.parkingSlots');

  @override
  ObservableList<VehicleEntryModel> get parkingSlots {
    _$parkingSlotsAtom.reportRead();
    return super.parkingSlots;
  }

  @override
  set parkingSlots(ObservableList<VehicleEntryModel> value) {
    _$parkingSlotsAtom.reportWrite(value, super.parkingSlots, () {
      super.parkingSlots = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ParkingStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getActiveEntriesAsyncAction =
      AsyncAction('_ParkingStoreBase.getActiveEntries');

  @override
  Future<void> getActiveEntries() {
    return _$getActiveEntriesAsyncAction.run(() => super.getActiveEntries());
  }

  final _$occupySlotAsyncAction = AsyncAction('_ParkingStoreBase.occupySlot');

  @override
  Future<void> occupySlot(VehicleEntryModel model, DateTime datetime) {
    return _$occupySlotAsyncAction.run(() => super.occupySlot(model, datetime));
  }

  final _$freeSlotAsyncAction = AsyncAction('_ParkingStoreBase.freeSlot');

  @override
  Future<void> freeSlot(VehicleEntryModel model, DateTime datetime) {
    return _$freeSlotAsyncAction.run(() => super.freeSlot(model, datetime));
  }

  final _$_ParkingStoreBaseActionController =
      ActionController(name: '_ParkingStoreBase');

  @override
  void setSlotHandledState(int slotId, bool state) {
    final _$actionInfo = _$_ParkingStoreBaseActionController.startAction(
        name: '_ParkingStoreBase.setSlotHandledState');
    try {
      return super.setSlotHandledState(slotId, state);
    } finally {
      _$_ParkingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
parkingSlots: ${parkingSlots}
    ''';
  }
}
