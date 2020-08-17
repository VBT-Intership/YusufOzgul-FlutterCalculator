import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  const CalculatorButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    double size = 75.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Center(
            child:
                Text(text, style: TextStyle(fontSize: 30, color: Colors.white)),
          )),
    );
  }
}
