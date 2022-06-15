import 'package:flutter/material.dart';
import 'GridButton.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  //const Grid({Key? key}) : super(key: key);

  var numbers = [];
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = size.height;

    return Container(
      height: height * 0.60,
      margin: EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    clickGrid(index);
                  })
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
