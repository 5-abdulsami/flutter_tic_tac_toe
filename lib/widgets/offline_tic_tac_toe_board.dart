import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';
import 'package:provider/provider.dart';

class OfflineTicTacToeBoard extends StatelessWidget {
  final String currentTurn;
  final Function(int) onMove;

  const OfflineTicTacToeBoard({
    super.key,
    required this.currentTurn,
    required this.onMove,
  });

  @override
  Widget build(BuildContext context) {
    OfflineGameProvider offlineGameProvider =
        Provider.of<OfflineGameProvider>(context);
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.55, maxWidth: 500),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: offlineGameProvider.board[index] == '' &&
                    offlineGameProvider.winner == ''
                ? () => onMove(index)
                : null,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
              ),
              child: Center(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    offlineGameProvider.board[index],
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: offlineGameProvider.board[index] == 'O'
                              ? redColor
                              : blueColor,
                          blurRadius: 40,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
