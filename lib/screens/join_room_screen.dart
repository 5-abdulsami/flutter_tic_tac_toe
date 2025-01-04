import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter_tic_tac_toe/responsive/responsive.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_text.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = "/join-room";
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final _nameController = TextEditingController();
  final _gameidController = TextEditingController();
  final _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameidController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(shadows: [
                Shadow(blurRadius: 40, color: blueColor),
              ], text: "Join Room", fontSize: 70),
              SizedBox(
                height: height * 0.1,
              ),
              CustomTextfield(
                hintText: "Enter your nickname",
                controller: _nameController,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomTextfield(
                hintText: "Enter Game ID",
                controller: _gameidController,
              ),
              SizedBox(
                height: height * 0.08,
              ),
              CustomButton(
                  text: "Join",
                  onPressed: () {
                    _socketMethods.joinRoom(
                        _nameController.text, _gameidController.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
