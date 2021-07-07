import 'package:flutter/material.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide()
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            "Vaga",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}