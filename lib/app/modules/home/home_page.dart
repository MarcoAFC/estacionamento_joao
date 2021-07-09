import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'stores/home_store.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() { 
    super.initState();
    controller.setIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Modular.get<GlobalKey<ScaffoldState>>(),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            backgroundColor: Color(0xFF3278ff),
            fixedColor: Colors.white,
            currentIndex: controller.index,
            items: [
              BottomNavigationBarItem(
                  label: 'Estacionamento',
                  icon: Icon(Icons.directions_car)),
              BottomNavigationBarItem(
                  label: 'Histórico', icon: Icon(Icons.history))
            ],
            onTap: controller.setIndex,
            selectedFontSize: 18,
            unselectedFontSize: 16,
            unselectedItemColor: Colors.black
          );
        }
      ),
      body: RouterOutlet()
      
    );
  }
}
