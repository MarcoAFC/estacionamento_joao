import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HistoryTile extends StatelessWidget {
  const HistoryTile({ Key? key, required this.model, this.colored = false}) : super(key: key);
  final VehicleEntryModel model;
  final bool colored;
  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('HH:mm - dd/MM/yy');
    String entryTime = formatter.format(model.start?? DateTime.now());
    String endTime = formatter.format(model.end?? DateTime.now());
    

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide()
        ),
        color: colored? Colors.grey[200] : Colors.white
      ),
      child: Row(
        children: [
          Icon(
            Icons.directions_car,
            color: model.active? 
              Colors.green : 
              Colors.black,
            size: 38,
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entrada: $entryTime',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                if(!model.active)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Saída: $endTime',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                if(!model.active)
                  Text(
                    'Tempo total: ${formatTotalTime()}',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              (model.slotId+1).toString(),
              style: TextStyle(
                fontSize: 30
              ),
            ),
          )
        ],
      ),
    );
  }
  String formatTotalTime(){
    var duration = model.end!.difference(model.start ?? DateTime.now());
    var hours = duration.inHours.floor().toString().padLeft(2, '0');
    var minutes = duration.inMinutes.remainder(60).floor().toString().padLeft(2, '0');
    return "$hours:$minutes";
  }
}