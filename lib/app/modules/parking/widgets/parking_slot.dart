import 'package:estacionamento_joao/app/core/consts/assets.dart';
import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'animated/animated_slot_container.dart';

class ParkingSlot extends StatelessWidget {
  const ParkingSlot({ Key? key, required this.model, this.onTap, this.reversed = false}) : super(key: key);
  final VehicleEntryModel model;
  final void Function()?  onTap;
  final bool reversed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            right: reversed? BorderSide.none :BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.grey),
            top: BorderSide(color: Colors.grey),
            left: reversed? BorderSide(color: Colors.black):BorderSide.none,
          ),
          color: getBackgroundColor()
        ),
        child: Stack(
          children: [
            if(model.beingHandled)
              AnimatedSlotContainer(),
            if(model.active)
              Transform.scale(
                scale: 0.9,
                child: RotatedBox(
                  quarterTurns: reversed? 2: 0,
                  child: 
                    SvgPicture.asset(
                      Images.carSvg,
                    ),
                ),
              ),
            if(model.active)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: reversed? Alignment.topLeft : Alignment.topRight,
                  child: Text(
                    (model.slotId+1).toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            if(!model.active)
              Center(
                child: Text(
                  (model.slotId+1).toString(),
                  style: Theme.of(context).textTheme.headline1,
                )
              ),
          ],
        )
      ),
    );
  }

  Color getBackgroundColor(){
    if(model.active){
      return Colors.grey.shade300;
    }
    else{
      return Colors.white;
    }
  }
}