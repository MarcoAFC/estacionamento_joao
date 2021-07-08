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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() { 
    super.initState();
    controller.setIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            backgroundColor: Colors.blue,
            fixedColor: Colors.white,
            currentIndex: controller.index,
            items: [
              BottomNavigationBarItem(
                  label: 'Estacionamento',
                  icon: Icon(Icons.car_repair_outlined)),
              BottomNavigationBarItem(
                  label: 'Histórico', icon: Icon(Icons.history))
            ],
            onTap: controller.setIndex,
            selectedFontSize: 18,
            unselectedFontSize: 16,
          );
        }
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 30.0, bottom: 8.0),
        child: RouterOutlet()
      )
    );
  }
}
