import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTitle extends StatelessWidget {
  //const MyTitle({Key? key}) : super(key: key);

  var size;

  MyTitle(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(top: 30.0),
      child: Text(
        "Sliding Game",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.050,
            color: Colors.white,
            decoration: TextDecoration.none),
      ),
    );
  }
}
