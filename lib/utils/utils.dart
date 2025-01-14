import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:flutter_tic_tac_toe/resources/game_methods.dart';
import 'package:provider/provider.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

void showGameDialogBox(BuildContext context, String text) {
  showDialog(
      // so that dialog is not closed when tapped outside
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  GameMethods().clearBoard(context);
                  Navigator.pop(context);
                },
                child: const Text("Play Again")),
          ],
        );
      });
}

void showOfflineGameDialogBox(BuildContext context, String text) {
  showDialog(
      // So that dialog is not closed when tapped outside
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            // Play Again for Offline Mode
            TextButton(
                onPressed: () {
                  // Reset the game for offline play
                  Provider.of<OfflineGameProvider>(context, listen: false)
                      .clearBoard(); // Resets the board and game state
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Play Again")),

            // Option to exit to Main Menu
            TextButton(
                onPressed: () {
                  Provider.of<OfflineGameProvider>(context, listen: false)
                      .resetGame();
                  Navigator.of(context)
                    ..pop()
                    ..pop(); // Close dialog without resetting and exit to main menu
                },
                child: const Text("Exit to Main Menu")),
          ],
        );
      });
}

void resetGameDialogBox(BuildContext context, String text) {
  showDialog(
      // So that dialog is not closed when tapped outside
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            // Play Again for Offline Mode
            TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Cancel")),

            // Option to exit to Main Menu
            TextButton(
                onPressed: () {

                  Provider.of<OfflineGameProvider>(context, listen: false)
                      .resetGame();
                  Navigator.of(context)
                    .pop()
                    ; },
                child: const Text("Reset Game")),
          ],
        );
      });
}
