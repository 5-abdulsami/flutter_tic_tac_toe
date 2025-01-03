import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  final List<String> _displayElements = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;

  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => _displayElements;
  int get filledBoxes => _filledBoxes;

  Player _player1 =
      Player(nickname: "", socketID: "", points: 0, playerType: "X");
  Player _player2 =
      Player(nickname: "", socketID: "", points: 0, playerType: "O");

  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElements[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  void setFilledBoxesTo0() {
    _filledBoxes = 0;
    notifyListeners();
  }
}
