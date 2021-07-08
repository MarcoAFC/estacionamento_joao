import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EndDialog extends StatelessWidget {
  EndDialog({ Key? key, required this.number, required this.onSaved}) : super(key: key);
  final int number;
  final Function(DateTime) onSaved;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja desocupar a vaga $number?'),
      actions: [
        TextButton(
          onPressed: (){
            Modular.to.pop(false);
          },
          child: Text(
            'CANCELAR', 
            style: TextStyle(
              color: Colors.red
            ),
          )
        ),
        TextButton(
          onPressed: (){
            onSaved(DateTime.now());
          }, 
          child: Text(
            'CONFIRMAR'
          )
        ),
      ],
    );
  }


}