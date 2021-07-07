import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/modules/home/store/home_store.dart';
import 'package:estacionamento_joao/app/modules/home/widgets/parking_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: buildParkingSlots(controller.parkingSlots.toList()),
            );
          }
        ),
      ),
    );
  }

  List<Widget> buildParkingSlots(List<VehicleEntryModel> parkingSlots) {
    var children = parkingSlots
        .map((slot) => ParkingSlot(
          model: slot,
          onTap: () async {
            print(slot.active);
            if(slot.active){
              await controller.freeSlot(slot, DateTime.now());
            }else{
              await controller.occupySlot(slot, DateTime.now());
            }
            print(slot.active);
          },
        ))
        .toList();
    return children;
  }
}
