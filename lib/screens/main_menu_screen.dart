import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(text: "Create Room", onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
          CustomButton(text: "Join Room", onPressed: () {})
        ],
      ),
    );
  }
}
