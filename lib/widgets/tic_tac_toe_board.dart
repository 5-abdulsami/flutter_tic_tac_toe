import 'package:flutter/material.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: 500),
      child: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(index.toString(),
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.blue,
                              blurRadius: 40,
                              offset: Offset(0, 2),
                            ),
                          ])),
                ));
          }),
    );
  }
}
