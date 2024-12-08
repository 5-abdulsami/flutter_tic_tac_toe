import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/room_data_provider.dart';
import 'package:flutter_tic_tac_toe/resources/socket_client.dart';
import 'package:flutter_tic_tac_toe/screens/game_screen.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {'nickname': nickname});
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GameScreen()),
      );
    });
  }
}
