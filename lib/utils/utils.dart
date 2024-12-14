import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/resources/game_methods.dart';

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
