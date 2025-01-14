import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/offline_game_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tic_tac_toe/utils/colors.dart';

class OfflineScoreboard extends StatelessWidget {
  const OfflineScoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    OfflineGameProvider offlineGameProvider =
        Provider.of<OfflineGameProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.07),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Player',
                  style: TextStyle(
                  fontSize: size.width * 0.08, fontWeight: FontWeight.bold, color: blueColor),
                ),
                TextSpan(
                  text: ' X',
  style: TextStyle(
                  fontSize: size.width * 0.085, fontWeight: FontWeight.bold, color: whiteColor, shadows: const [
                        Shadow(
                          color: blueColor
                              ,
                          blurRadius: 40,
                          offset: Offset(0, 0.9),
                        ),
                      ], ),
            
                ),
              ]
            )),
            SizedBox(height: size.height * 0.015,),
            Text(
              offlineGameProvider.xScore.toString(), // Player X score
              style: TextStyle(fontSize: size.width * 0.07, color: whiteColor),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(size.width * 0.065),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Player',
                  style: TextStyle(
                  fontSize: size.width * 0.08, fontWeight: FontWeight.bold, color: blueColor,),
                ),
                TextSpan(
                  text: ' O',
  style: TextStyle(
                  fontSize: size.width * 0.085, fontWeight: FontWeight.bold, color: whiteColor, shadows: const [
                        Shadow(
                          color: redColor
                              ,
                          blurRadius: 40,
                          offset: Offset(0, 0.9),
                        ),
                      ],),
            
                ),
              ]
            )),
            SizedBox(height: size.height * 0.015,),
            Text(
              offlineGameProvider.oScore.toString(), // Player O score
              style: TextStyle(fontSize: size.width * 0.07, color: whiteColor),
            ),
          ]),
        ),
      ],
    );
  }
}
