import 'package:flutter/material.dart';
import 'package:flutter_templates/templates/pinScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: PinScreen(
        title: "Enter your PIN",
        snackBar: true,
        snackBarText: "Wrong PIN!",
        visibleColor: Colors.blue,
        deleteColor: Colors.red,
        errorColor: Colors.red,
        pinCount: 4,
      )),
    );
  }
}
