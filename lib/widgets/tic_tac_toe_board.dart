import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/provider/room_data_provider.dart';
import 'package:flutter_tic_tac_toe/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();
  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(index, roomDataProvider.roomData['_id'],
        roomDataProvider.displayElements);
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: 500),
      child: AbsorbPointer(
        // to dis-allow the same user to play consecutive turns
        // check if the current turn's socket id is not equal to the socket method's client id
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => tapped(index, roomDataProvider),
                child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: Text(roomDataProvider.displayElements[index],
                            style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: roomDataProvider
                                                .displayElements[index] ==
                                            'O'
                                        ? Colors.red
                                        : Colors.blue,
                                    blurRadius: 40,
                                    offset: const Offset(0, 2),
                                  ),
                                ])),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
