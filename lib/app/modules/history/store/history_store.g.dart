// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryStore on _HistoryStoreBase, Store {
  final _$entriesAtom = Atom(name: '_HistoryStoreBase.entries');

  @override
  ObservableList<VehicleEntryModel> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(ObservableList<VehicleEntryModel> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_HistoryStoreBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
entries: ${entries}
    ''';
  }
}