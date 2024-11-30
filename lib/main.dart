import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/main_menu_screen.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      home: const MainMenuScreen(),
    );
  }
}
