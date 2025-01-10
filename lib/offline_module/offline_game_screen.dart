import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/offline_module/offline_scorebord.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:flutter_tic_tac_toe/widgets/offline_tic_tac_toe_board.dart';
import 'package:provider/provider.dart';

class OfflineGameScreen extends StatelessWidget {
  static const String routeName = '/offline-game-screen';
  const OfflineGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    OfflineGameProvider offlineGameProvider =
        Provider.of<OfflineGameProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Reusable Scoreboard Widget
              const OfflineScoreboard(),
              // Offline Tic-Tac-Toe Board
              OfflineTicTacToeBoard(
                currentTurn: offlineGameProvider.currentPlayer,
                onMove: (index) {
                  offlineGameProvider.makeMove(
                      index, context); // Pass context to makeMove
                },
              ),
              // Status Bar to show who's turn or if there's a winner
              _StatusBar(),
              ElevatedButton(
                onPressed: () {
                  Provider.of<OfflineGameProvider>(context, listen: false)
                      .resetGame();
                },
                child: const Text('Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final offlineGameProvider = Provider.of<OfflineGameProvider>(context);
    String status = offlineGameProvider.winner.isNotEmpty
        ? (offlineGameProvider.winner == 'Draw'
            ? 'It\'s a Draw!'
            : '${offlineGameProvider.winner} Wins!')
        : 'Current Turn: ${offlineGameProvider.currentPlayer}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        status,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
