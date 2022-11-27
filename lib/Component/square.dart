import 'package:flutter/material.dart';
import 'package:untitled/Screens/multiplayer_tiktaktoe.dart';

class Square extends StatefulWidget {
  const Square({Key? key, required this.currentPlayer, required this.getNextPlayer}) : super(key: key);
  final bool currentPlayer;
  final VoidCallback getNextPlayer;
  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Icon? iconToDisplay;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            child: Container(
              color: Colors.blue,
              child: iconToDisplay,
            ),
          onTap: () {
            setState(() {
              Icon playerIcon;
              if (widget.currentPlayer){
                playerIcon = const Icon(Icons.close, size: 50);
              } else {
                playerIcon = const Icon(Icons.circle_outlined, size: 50);
              }
              iconToDisplay ??= playerIcon;
            });
            getNextPlayer;
          }
        ),
      ),
    );
  }
}
