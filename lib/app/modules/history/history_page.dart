import 'package:estacionamento_joao/app/core/models/vehicle_entry_model.dart';
import 'package:estacionamento_joao/app/modules/history/store/history_store.dart';
import 'package:estacionamento_joao/app/modules/history/widgets/history_header.dart';
import 'package:estacionamento_joao/app/modules/history/widgets/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends ModularState<HistoryPage, HistoryStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HistoryHeader(),
            Flexible(
              fit: FlexFit.loose,
              child: Observer(
                builder: (BuildContext context) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.entries.length,
                    itemBuilder: (context, index){
                      return HistoryTile(
                        model: controller.entries[index],
                        colored: index%2 ==0,
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}