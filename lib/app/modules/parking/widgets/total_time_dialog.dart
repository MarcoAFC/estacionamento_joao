import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TotalTimeDialog extends StatelessWidget {
  const TotalTimeDialog({ Key? key, required this.startTime, required this.endTime}) : super(key: key);
  final DateTime? startTime;
  final DateTime endTime;
  @override
  Widget build(BuildContext context) {
    var totalTime = endTime.difference(startTime ?? endTime);
    var hours = totalTime.inHours.floor().toString().padLeft(2, '0');
    var minutes = totalTime.inMinutes.remainder(60).floor().toString().padLeft(2, '0');
    return AlertDialog(
      content: SingleChildScrollView(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            children: [
              TextSpan(
                text: 'O veículo ocupou a vaga por '
              ),
              TextSpan(
                text: '$hours:$minutes',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: ' horas'
              ),

            ]
          )
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            Modular.to.pop(false);
          },
          child: Text(
            'OK', 
          )
        ),
      ],
    );
  }
}