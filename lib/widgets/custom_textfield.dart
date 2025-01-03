import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: blueColor, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: TextField(
          readOnly: isReadOnly,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: bgColor,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ));
  }
}
