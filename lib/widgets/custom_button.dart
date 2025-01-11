import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonColor = blueColor});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: buttonColor, blurRadius: 5, spreadRadius: 0)
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width, 50),
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: whiteColor),
        ),
      ),
    );
  }
}
