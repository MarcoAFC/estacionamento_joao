import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final PageController pageViewController = PageController();
  @observable
  int index = 0;

  @action
  void setIndex(int index){
    if (index == 0) {
      Modular.to.navigate('/parking');
    } else if (index == 1) {
      Modular.to.navigate('/history');
    } 
    this.index = index;
  }
}