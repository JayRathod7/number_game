import 'package:flutter/material.dart';
import 'package:number_game/screen/choose_number/number_select_screen.dart';
import 'package:number_game/screen/select_number/select_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseNumber(),
    );
  }
}
