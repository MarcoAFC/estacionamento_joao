import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  App({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estacionamento Virtual',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    ).modular();
  }
}