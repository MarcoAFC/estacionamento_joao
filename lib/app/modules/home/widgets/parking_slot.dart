import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter/material.dart';

class ParkingSlot extends StatelessWidget {
  const ParkingSlot({ Key? key, required this.model, this.onTap}) : super(key: key);
  final VehicleEntryModel model;
  final void Function()?  onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: model.active ? 
            Colors.red : 
            Colors.green,
          border: Border.all()
        ),
      ),
    );
  }
}