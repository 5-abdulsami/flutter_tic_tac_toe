import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/room_data_provider.dart';
import 'package:flutter_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter_tic_tac_toe/screens/waiting_lobby.dart';
import 'package:flutter_tic_tac_toe/widgets/scoreboard.dart';
import 'package:flutter_tic_tac_toe/widgets/tic_tac_toe_board.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game-screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    print(Provider.of<RoomDataProvider>(context).player2.nickname);
    return Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? WaitingLobby()
            : SafeArea(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Scoreboard(),
                  TicTacToeBoard(),
                  Text(
                      "${roomDataProvider.roomData['turn']['nickname']}'s turn"),
                ],
              )));
  }
}
