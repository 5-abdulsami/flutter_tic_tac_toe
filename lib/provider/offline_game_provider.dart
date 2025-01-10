import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/utils.dart';

class OfflineGameProvider with ChangeNotifier {
  List<String> _board = List.filled(9, ''); // Tic-tac-toe board
  int _filledBoxes = 0; // Track filled boxes
  String _currentPlayer = 'X'; // Current player's turn
  String _winner = ''; // Winner of the game
  int xScore = 0; // Player X score
  int oScore = 0; // Player O score

  List<String> get board => _board;
  int get filledBoxes => _filledBoxes;
  String get currentPlayer => _currentPlayer;
  String get winner => _winner;

  // Rest of your methods...

  void resetGame() {
    _board = List.filled(9, '');
    _filledBoxes = 0;
    _currentPlayer = 'X';
    _winner = '';
    xScore = 0;
    oScore = 0;
    notifyListeners();
  }

  void clearBoard() {
    _board = List.filled(9, '');
    _filledBoxes = 0;
    _currentPlayer = 'X';
    _winner = '';
    notifyListeners();
  }

  void makeMove(int index, BuildContext context) {
    if (_board[index] == '' && _winner == '') {
      _board[index] = _currentPlayer;
      _filledBoxes++;
      if (_checkWinner(index)) {
        _winner = _currentPlayer;
        if (_winner == 'X') {
          xScore++; // Increment Player X score
        } else if (_winner == 'O') {
          oScore++; // Increment Player O score
        }
        // Show dialog when the game is over
        showOfflineGameDialogBox(context, '$winner Wins!');
      } else if (_filledBoxes == 9) {
        _winner = 'Draw';
        showOfflineGameDialogBox(context, 'It\'s a Draw!');
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  bool _checkWinner(int index) {
    List<List<int>> winningPatterns = [
      [0, 1, 2], // First row
      [3, 4, 5], // Second row
      [6, 7, 8], // Third row
      [0, 3, 6], // First column
      [1, 4, 7], // Second column
      [2, 5, 8], // Third column
      [0, 4, 8], // Diagonal \
      [2, 4, 6], // Diagonal /
    ];

    for (List<int> pattern in winningPatterns) {
      if (pattern.contains(index) &&
          _board[pattern[0]] == _currentPlayer &&
          _board[pattern[1]] == _currentPlayer &&
          _board[pattern[2]] == _currentPlayer) {
        return true;
      }
    }
    return false;
  }
}
