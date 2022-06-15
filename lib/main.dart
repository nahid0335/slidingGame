import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'board.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // ignore: deprecated_member_use
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const SlideGame());
}

class SlideGame extends StatelessWidget {
  const SlideGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Slide Game',
      debugShowCheckedModeBanner: false,
      home: Board(),
    );
  }
}
