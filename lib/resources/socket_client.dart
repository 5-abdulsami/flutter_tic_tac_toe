import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient.internal() {
    socket = IO.io("http://192.168.18.16:3000", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();

    // Add a listener to verify connection
    socket!.on('connect', (_) {
      print('Connected to the server');
    });

    socket!.on('connect_error', (data) {
      print('Connection error: $data');
    });
  }

  static SocketClient get instance {
    _instance ??= SocketClient.internal();
    return _instance!;
  }
}
