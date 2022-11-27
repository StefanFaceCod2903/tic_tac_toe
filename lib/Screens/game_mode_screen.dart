import 'package:flutter/material.dart';

import 'multiplayer_tiktaktoe.dart';

class GameModeScreen extends StatefulWidget {
  const GameModeScreen({Key? key}) : super(key: key);

  @override
  State<GameModeScreen> createState() => _GameModeScreenState();
}

class _GameModeScreenState extends State<GameModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Choose the game mode!"),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey)),
                onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MultiplayerTikTakToe()),
            );}, child: const Text("Multiplayer"))
          ],
        ),
      ),
    );
  }
}
