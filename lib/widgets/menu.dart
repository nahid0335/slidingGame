import 'package:flutter/material.dart';
import 'package:slidegame/widgets/move.dart';
import 'package:slidegame/widgets/resetbutton.dart';
import 'package:slidegame/widgets/time.dart';

class Menu extends StatelessWidget {
  //const Menu(void Function() reset, {Key? key}) : super(key: key);

  final VoidCallback reset;
  int move;
  int secondsPassed;
  var size;

  Menu(this.reset, this.move, this.secondsPassed, this.size, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ResetButton(reset),
            Move(move),
            Time(secondsPassed),
          ]),
    );
  }
}
