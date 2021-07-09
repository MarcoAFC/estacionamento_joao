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

  final _$showActiveAtom = Atom(name: '_HistoryStoreBase.showActive');

  @override
  bool get showActive {
    _$showActiveAtom.reportRead();
    return super.showActive;
  }

  @override
  set showActive(bool value) {
    _$showActiveAtom.reportWrite(value, super.showActive, () {
      super.showActive = value;
    });
  }

  final _$showInactiveAtom = Atom(name: '_HistoryStoreBase.showInactive');

  @override
  bool get showInactive {
    _$showInactiveAtom.reportRead();
    return super.showInactive;
  }

  @override
  set showInactive(bool value) {
    _$showInactiveAtom.reportWrite(value, super.showInactive, () {
      super.showInactive = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_HistoryStoreBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_HistoryStoreBaseActionController =
      ActionController(name: '_HistoryStoreBase');

  @override
  void setShowActive() {
    final _$actionInfo = _$_HistoryStoreBaseActionController.startAction(
        name: '_HistoryStoreBase.setShowActive');
    try {
      return super.setShowActive();
    } finally {
      _$_HistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowInactive() {
    final _$actionInfo = _$_HistoryStoreBaseActionController.startAction(
        name: '_HistoryStoreBase.setShowInactive');
    try {
      return super.setShowInactive();
    } finally {
      _$_HistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void manageEntries() {
    final _$actionInfo = _$_HistoryStoreBaseActionController.startAction(
        name: '_HistoryStoreBase.manageEntries');
    try {
      return super.manageEntries();
    } finally {
      _$_HistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entries: ${entries},
showActive: ${showActive},
showInactive: ${showInactive}
    ''';
  }
}
