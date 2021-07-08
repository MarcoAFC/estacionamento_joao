import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'store/home_store.dart';
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text('Estacionamento do João'),
      //   centerTitle: true,
      //   leading: IconButton(
      //     tooltip: 'Abrir histórico',
      //     icon: Icon(
      //       Icons.history,
      //     ),
      //     onPressed: (){
      //       Modular.to.pushNamed('/history');
      //     },
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Estacionamento',
            icon: Icon(Icons.car_repair_outlined)
          ),
          BottomNavigationBarItem(
            label: 'Histórico',
            icon: Icon(Icons.history)
          )
        ],
        onTap: (index){
          
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.0),
          child: Observer(
            builder: (_) {
              return GridView.count(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: buildParkingSlots(controller.parkingSlots.toList()),
              );
            }
          ),
        ),
      ),
    );
  }

  List<Widget> buildParkingSlots(List<VehicleEntryModel> parkingSlots) {
    var children = parkingSlots
        .map((slot) => ParkingSlot(
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
        ))
        .toList();
    return children;
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
            ScaffoldMessenger.of(scaffoldKey.currentContext?? context).showSnackBar(
              SnackBar(
                content: Text(
                  'Veículo removido com sucesso!',
                ),
                backgroundColor: Colors.red[800],
              )
            );
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
            ScaffoldMessenger.of(scaffoldKey.currentContext?? context).showSnackBar(
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
  }
  
}
