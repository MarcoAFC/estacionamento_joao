import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                  child: Text(
                    'Estacionamento do Seu João', 
                    style: TextStyle(
                      fontSize: 18
                    )
                  ),
                )
              ),
              )
          ),
          Container(
            height: 80,
            child: Material(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: (){
                  Modular.to.pushNamed('/history');
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.history,
                        color: Color(0xFF0a437a),
                        size: 38,
                      ),
                    ),
                    Text(
                      'Histórico',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}