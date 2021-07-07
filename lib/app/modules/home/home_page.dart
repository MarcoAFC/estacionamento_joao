import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/modules/home/store/home_store.dart';
import 'package:estacionamento_joao/app/modules/home/widgets/parking_slot.dart';
import 'package:estacionamento_joao/app/modules/home/widgets/start_dialog.dart';
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
            
            if(slot.active){
              await showDialog(
                context: context, 
                builder: (context){
                  return StartDialog(
                    number: slot.slotId+1,
                    onSaved: (time) async {
                      await controller.freeSlot(slot, time);
                      Modular.to.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Registro salvo com sucesso!',
                          ),
                          backgroundColor: Colors.green[800],
                        )
                      );
                    },
                  );
                }
              );
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
