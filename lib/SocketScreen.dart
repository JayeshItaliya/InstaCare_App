import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketScreen extends StatefulWidget {
  const SocketScreen({super.key});

  @override
  State<SocketScreen> createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  late IO.Socket _socket;
  TextEditingController _controller=TextEditingController();

  connectSocket(){
    _socket.onConnect((data) => print('connect'));
    _socket.onConnectError((data) => print('connection Error'));
    _socket.onDisconnect((data) => print('Disconnected'));
    _socket.on("message", (data) => print(data));
  }

  senData(){
    _socket.emit('message',{
      'msg':'abc def ghi',
      'msg2':'abc def ghi',
    });
  }
  @override
  void initState() {
    super.initState();
    _socket =IO.io("https://192.168.43.92:5000",IO.OptionBuilder().setTransports(["websocket"]).setQuery(
        {'username':"abcd"}).build());
    connectSocket();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }
}
