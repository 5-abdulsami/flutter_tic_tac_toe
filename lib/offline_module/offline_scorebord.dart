import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

class OfflineScoreboard extends StatelessWidget {
  const OfflineScoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    OfflineGameProvider offlineGameProvider =
        Provider.of<OfflineGameProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Player X', // Fixed name as this is for offline mode
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: blueColor),
            ),
            Text(
              offlineGameProvider.xScore.toString(), // Player X score
              style: const TextStyle(fontSize: 25, color: whiteColor),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Player O', // Fixed name as this is for offline mode
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: blueColor),
            ),
            Text(
              offlineGameProvider.oScore.toString(), // Player O score
              style: const TextStyle(fontSize: 25, color: whiteColor),
            ),
          ]),
        ),
      ],
    );
  }
}
