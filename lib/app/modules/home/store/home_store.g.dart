// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$parkingSlotsAtom = Atom(name: '_HomeStoreBase.parkingSlots');

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

  final _$initAsyncAction = AsyncAction('_HomeStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getActiveEntriesAsyncAction =
      AsyncAction('_HomeStoreBase.getActiveEntries');

  @override
  Future<void> getActiveEntries() {
    return _$getActiveEntriesAsyncAction.run(() => super.getActiveEntries());
  }

  final _$occupySlotAsyncAction = AsyncAction('_HomeStoreBase.occupySlot');

  @override
  Future<void> occupySlot(VehicleEntryModel model, DateTime datetime) {
    return _$occupySlotAsyncAction.run(() => super.occupySlot(model, datetime));
  }

  final _$freeSlotAsyncAction = AsyncAction('_HomeStoreBase.freeSlot');

  @override
  Future<void> freeSlot(VehicleEntryModel model, DateTime datetime) {
    return _$freeSlotAsyncAction.run(() => super.freeSlot(model, datetime));
  }

  @override
  String toString() {
    return '''
parkingSlots: ${parkingSlots}
    ''';
  }
}
