import 'package:flutter/material.dart';

import 'Screens/game_mode_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tik tak toe.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameModeScreen(),
    );
  }
}