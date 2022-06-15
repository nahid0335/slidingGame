import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slidegame/widgets/time.dart';
import 'widgets/menu.dart';
import 'widgets/grid.dart';
import 'widgets/mytitle.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int secondsPassed = 0;

  Timer? timer;
  static const duration = const Duration(seconds: 1);
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (timer == null) {
      timer = Timer.periodic(duration, (timer) {
        startTimer();
      });
    }

    return SafeArea(
      child: Container(
        height: size.height,
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            MyTitle(size),
            Grid(numbers, size, clickGrid),
            Menu(reset, move, secondsPassed, size),
          ],
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      if (secondsPassed == 0) {
        isActive = true;
      }
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
      checkWin();
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void startTimer() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    //print(numbers);
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "You Win !!!\nMove: ${move}, Time: ${secondsPassed}s",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 220.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          reset();
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
