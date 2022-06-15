import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  //const Time({Key? key}) : super(key: key);

  int secondsPassed;

  Time(this.secondsPassed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Text(
        "Time: ${secondsPassed}",
        style: TextStyle(
            fontSize: 18, decoration: TextDecoration.none, color: Colors.white),
      ),
    );
  }
}
