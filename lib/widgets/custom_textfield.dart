import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextfield(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText, filled: true, fillColor: bgColor),
      ),
    );
  }
}