import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_button.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_text.dart';
import 'package:flutter_tic_tac_toe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
                hintText: "Enter your nickname", controller: _nameController),
            SizedBox(
              height: height * 0.06,
            ),
            CustomButton(text: "Create", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
