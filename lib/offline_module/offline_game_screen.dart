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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Tic-Tac-Toe'),
      ),
      body: Column(
        children: [
          // Reusable Scoreboard Widget
          const OfflineScoreboard(),
          const SizedBox(height: 20),
          // Offline Tic-Tac-Toe Board
          Expanded(
            child: Consumer<OfflineGameProvider>(
              builder: (context, provider, _) {
                return OfflineTicTacToeBoard(
                  currentTurn: provider.currentPlayer,
                  onMove: (index) {
                    provider.makeMove(
                        index, context); // Pass context to makeMove
                  },
                );
              },
            ),
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
    );
  }
}

class _StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OfflineGameProvider>(context);
    String status = provider.winner.isNotEmpty
        ? (provider.winner == 'Draw'
            ? 'It\'s a Draw!'
            : '${provider.winner} Wins!')
        : 'Current Turn: ${provider.currentPlayer}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        status,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
