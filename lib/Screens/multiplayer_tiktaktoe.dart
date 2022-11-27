import 'package:flutter/material.dart';

void getNextPlayer(player) {
  player = !player;
}

bool boardIsFull(List<Icon?> icons) {
  for (int i = 0; i < icons.length; i++) {
    if (icons[i] == null) {
      return false;
    }
  }
  return true;
}

bool checkWinner(List<bool> list) {
  if (list[0] && list[1] && list[2]) {
    return true;
  }
  if (list[3] && list[4] && list[5]) {
    return true;
  }
  if (list[6] && list[7] && list[8]) {
    return true;
  }
  if (list[0] && list[3] && list[6]) {
    return true;
  }
  if (list[1] && list[4] && list[7]) {
    return true;
  }
  if (list[2] && list[5] && list[8]) {
    return true;
  }
  if (list[0] && list[4] && list[8]) {
    return true;
  }
  if (list[2] && list[4] && list[6]) {
    return true;
  }
  return false;
}

class MultiplayerTikTakToe extends StatefulWidget {
  const MultiplayerTikTakToe({Key? key}) : super(key: key);

  @override
  State<MultiplayerTikTakToe> createState() => _MultiplayerTikTakToeState();
}

class _MultiplayerTikTakToeState extends State<MultiplayerTikTakToe> {
  final xIcon = const Icon(Icons.close, size: 50);
  final zeroIcon = const Icon(Icons.circle_outlined, size: 50);
  var currentPlayer = false;
  var boardIcons = List<Icon?>.filled(9, null);
  var boardIsZero = List<bool>.filled(9, false);
  var boardIsX = List<bool>.filled(9, false);
  String winnerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Tictactoe in multiplayer"),
        ),
      ),
      body: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                          color: Colors.blue,
                          child: boardIcons[index],
                        ),
                        onTap: () {
                          if (winnerText == "") {
                            setState(() {
                              Icon playerIcon;
                              if (currentPlayer) {
                                playerIcon = const Icon(Icons.close, size: 50);
                                boardIsX[index] = true;
                                if (checkWinner(boardIsX)) {
                                  winnerText = "Winner: X!";
                                }
                              } else {
                                playerIcon = const Icon(Icons.circle_outlined, size: 50);
                                boardIsZero[index] = true;
                                if (checkWinner(boardIsZero)) {
                                  winnerText = "Winner: 0!";
                                }
                              }
                              boardIcons[index] ??= playerIcon;
                              currentPlayer = !currentPlayer;
                            });
                          }
                          if (boardIsFull(boardIcons) && winnerText == "") {
                            winnerText = "Draw";
                          }
                        }),
                  ),
                );
              }),
          Text(
            winnerText,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          if (winnerText != "")
            TextButton(
              onPressed: () {
                setState(() {
                  boardIcons.fillRange(0, 9, null);
                  boardIsZero.fillRange(0, 9, false);
                  boardIsX.fillRange(0, 9, false);
                  winnerText = "";
                  currentPlayer = false;
                });
              },
              child: Text("Play again!"),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey)),
            ),
        ],
      ),
    );
  }
}
