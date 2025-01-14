import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/offline_module/offline_scorebord.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';
import 'package:flutter_tic_tac_toe/utils/utils.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';
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
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: CustomButton(
                  buttonColor: redColor,
                  onPressed: () {
                    resetGameDialogBox(context, "Are you sure you want to reset the game?");
                  },
                  text: "Reset Game",
                ),
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
    var size = MediaQuery.of(context).size;
    final offlineGameProvider = Provider.of<OfflineGameProvider>(context);
    String status = offlineGameProvider.winner.isNotEmpty
        ? (offlineGameProvider.winner == 'Draw'
            ? 'It\'s a Draw!'
            : '${offlineGameProvider.winner} Wins!')
        : 'Current Turn: ${offlineGameProvider.currentPlayer}';

    return Padding(
      padding: EdgeInsets.all(size.width * 0.02),
      child: Text(
        status,
        style: TextStyle(fontSize: size.width * 0.075),
      ),
    );
  }
}
