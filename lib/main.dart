import 'package:flutter/material.dart';
import 'package:flutter_templates/templates/slidingTile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            SlidingTile(
              topLeftText: "08:00",
              bottomLeftText: "10:00",
              tileTopText: "31FKC1",
              tileMidText: "Cudzí jazyk",
              tileBtmText: "Ing. Tomáš Gula",
              tileTopRight: "BD318",
              lineColor: Colors.green,
              firstColor: Colors.blue.shade500,
              secondColor: Colors.green.shade500,
              firstIcon: Icons.share,
              secondIcon: Icons.notification_add,
              firstAction: () {
                print("test");
              },
              secondAction: () {
                print("test2");
              },
            ),
            const SizedBox(height: 10),
            SlidingDoubleTile(
              topLeftText: "12:00",
              bottomLeftText: "14:00",
              tileTopText1: "31FKC1",
              tileMidText1: "Softvérovo definované siete a cloudové riešenia",
              tileBtmText1: "Ing. Anton Strelec",
              tileTopRight1: "BD318",
              lineColor1: Colors.amber.shade600,
              firstColor1: Colors.blue.shade500,
              secondColor1: Colors.green.shade500,
              firstIcon1: Icons.share,
              secondIcon1: Icons.notification_add,
              firstAction1: () {
                print("test_1_1");
              },
              secondAction1: () {
                print("test_1_2");
              },
              tileTopText2: "2ZED10",
              tileMidText2: "Internet vecí",
              tileBtmText2: "Ing. Jozef Barla",
              tileTopRight2: "BC310",
              lineColor2: Colors.blue.shade600,
              firstColor2: Colors.blue.shade500,
              secondColor2: Colors.green.shade500,
              firstIcon2: Icons.share,
              secondIcon2: Icons.notification_add,
              firstAction2: () {
                print("test_2_1");
              },
              secondAction2: () {
                print("test_2_2");
              },
            )
          ],
        ),
      )),
    );
  }
}
