import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  const CustomText(
      {super.key,
      required this.shadows,
      required this.text,
      required this.fontSize,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, shadows: shadows),
      textAlign: textAlign,
    );
  }
}
