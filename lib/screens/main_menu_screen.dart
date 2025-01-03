import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/responsive/responsive.dart';
import 'package:flutter_tic_tac_toe/screens/create_room_screen.dart';
import 'package:flutter_tic_tac_toe/screens/join_room_screen.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_text.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-menu";
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: const Text("Flutter Tic Tac Toe"),
      ),
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(blurRadius: 40, color: blueColor),
                ],
                text: "Multi Player Tic Tac Toe",
                fontSize: 50,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              CustomButton(
                  text: "Create Room",
                  onPressed: () {
                    Navigator.pushNamed(context, CreateRoomScreen.routeName);
                  }),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                  text: "Join Room",
                  onPressed: () {
                    Navigator.pushNamed(context, JoinRoomScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
