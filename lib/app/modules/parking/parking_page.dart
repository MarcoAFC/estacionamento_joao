import 'package:estacionamento_joao/app/core/consts/project_consts.dart';
import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'store/parking_store.dart';
import 'widgets/end_dialog.dart';
import 'widgets/parking_slot.dart';
import 'widgets/start_dialog.dart';
import 'widgets/total_time_dialog.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({Key? key}) : super(key: key);

  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends ModularState<ParkingPage, ParkingStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          color: Colors.grey,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  "Estacionamento do Seu João", 
                ),
                centerTitle: true,
                backgroundColor: Color(0xFF3278ff),
                floating: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 8.0, bottom: 8.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    childAspectRatio: 1.5
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index){
                      return buildParkingSlots(controller.parkingSlots[index]);
                    },
                    childCount: controller.parkingSlots.length
                  ),
                  
                ),
              )
            ],
          ),
        );
      }
    );
  }

  Widget buildParkingSlots(VehicleEntryModel slot) {
    return ParkingSlot(
      model: slot,
      reversed: slot.slotId%2 == 1,
      onTap: () async {
        controller.setSlotHandledState(slot.slotId, true);
        if(slot.active){
          await handleActiveSlot(context, slot);
        }else{
          await handleInactiveSlot(context, slot);       
        }
        controller.setSlotHandledState(slot.slotId, false);
      },
    );
  }

  Future<void> handleActiveSlot(BuildContext context, VehicleEntryModel slot) async {
    await showDialog(
      context: context, 
      builder: (context){
        return EndDialog(
          number: slot.slotId+1,
          onSaved: (time) async {
            Modular.to.pop();
            showDialog(
              context: context, 
              builder: (context){
                return TotalTimeDialog(
                  startTime: slot.start,
                  endTime: time,
                );
              }
            );
            await controller.freeSlot(slot, time);
            // ScaffoldMessenger.of(scaffoldKey.currentContext?? context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       'Veículo removido com sucesso!',
            //     ),
            //     backgroundColor: Colors.red[800],
            //   )
            // );
          },
        );
      }
    );
  }

  Future<void> handleInactiveSlot(BuildContext context, VehicleEntryModel slot) async {
    await showDialog(
      context: context, 
      builder: (context){
        return StartDialog(
          number: slot.slotId+1,
          onSaved: (time) async {
            await controller.occupySlot(slot, time);
            Modular.to.pop();
            // ScaffoldMessenger.of(scaffoldKey.currentContext?? context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       'Registro salvo com sucesso!',
            //     ),
            //     backgroundColor: Colors.green[800],
            //   )
            // );
          },
        );
      }
    ); 
  }
  
}
