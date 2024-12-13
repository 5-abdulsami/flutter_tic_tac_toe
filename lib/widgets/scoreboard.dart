import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              roomDataProvider.player1.nickname,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              roomDataProvider.player1.points.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              roomDataProvider.player2.nickname,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              roomDataProvider.player2.points.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
        ),
      ],
    );
  }
}