import 'package:socket_io/socket_io.dart';

class ServerChat {
  var io = Server();

  void listen() {
    io.on('connection', (client) {
      print('User: ${client.id} connected');

      client.on('message', handleMessage);
    });

    io.listen(3000);
  }

  void handleMessage(msg, client) {
    var data = {
      'user': client.id,
      'message': msg,
      'date': DateTime.now().toString(),
    };

    print(data);

    client.broadcast.emit('message', data);
    //client.emit('message', data);
  }
}
