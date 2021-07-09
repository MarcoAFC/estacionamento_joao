import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartDialog extends StatelessWidget {
  StartDialog({ Key? key, required this.number, required this.onSaved}) : super(key: key);
  final int number;
  final TextEditingController _hourController = TextEditingController(text: DateTime.now().hour.toString());
  final TextEditingController _minuteController = TextEditingController(text: DateTime.now().minute.toString());
  final Function(DateTime) onSaved;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja alocar um veículo à vaga $number?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Configure o horário de entrada do veículo:'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('^(2[0-3]|[01]?[0-9])'), allow: true)
                  ],
                  decoration: InputDecoration(
                    hintText: 'HH'
                  ),
                  textAlign: TextAlign.center,
                  controller: _hourController,
                )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('^(2[0-3]|[0-5]?[0-9])'), allow: true)
                  ],
                  decoration: InputDecoration(
                    hintText: 'MM'
                  ),
                  textAlign: TextAlign.center,
                  controller: _minuteController,
                  onEditingComplete: finishEditing,
                )
              ),
            ],
          )
        ],
      ),
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
          onPressed: finishEditing, 
          child: Text(
            'CONFIRMAR'
          )
        ),
      ],
    );
  }

  void finishEditing(){
    var now = DateTime.now();
    var customTime = DateTime(now.year, now.month, now.day, int.parse(_hourController.text), int.parse(_minuteController.text));
    onSaved(customTime);
  }
}