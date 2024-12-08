import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter_tic_tac_toe/responsive/responsive.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_text.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  SocketMethods socketMethods = SocketMethods();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(shadows: [
                  Shadow(blurRadius: 40, color: Colors.blue),
                ], text: "Create Room", fontSize: 70),
                SizedBox(
                  height: height * 0.1,
                ),
                CustomTextfield(
                    hintText: "Enter your nickname",
                    controller: _nameController),
                SizedBox(
                  height: height * 0.08,
                ),
                CustomButton(
                    text: "Create",
                    onPressed: () {
                      socketMethods.createRoom(_nameController.text);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
