import 'package:flutter/material.dart';

class HistoryFilterButton extends StatelessWidget {
  const HistoryFilterButton({ Key? key, required this.onPressed, required this.color, this.active = true}) : super(key: key);
  final VoidCallback onPressed;
  final Color color;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: active? Colors.white : Colors.red, width: 3),
          color: color
        ),
        width: 38,
        height: 38,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints(minWidth: 54),
    );
  }
}