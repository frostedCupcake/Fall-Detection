import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  final String _url =
      'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self';
  // final String _url = 'ws://192.168.71.5:8080/';
  late WebSocketChannel _channel;
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _channel = IOWebSocketChannel.connect(_url);
    _listenToWebSocket();
  }

  void _listenToWebSocket() {
    _channel.stream.listen(
      (message) {
        setState(() {
          _messages.add(message);
        });
      },
      onError: (error) {
        print("WebSocket Error: $error");
      },
      onDone: () {
        print("WebSocket connection closed");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_messages[index]));
        },
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
