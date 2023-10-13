import 'package:final_project/utils/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  // final String _url = 'wss://socketsbay.com/wss/v2/1/demo/';
  final String _url = 'ws://192.168.71.5:1337/';

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
      appBar: AppBar(
        title: NormalText(
          text: 'Notifications',
          color: Colors.white,
        ),
        backgroundColor:
            Colors.blue, // Set your desired app bar background color
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          const NormalText(text: "List of notifications when fall is detected"),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5, // Add elevation for a shadow effect
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18), // Add margin around the cards
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(
                        16), // Add padding to the list tile content
                    title: Text(
                      _messages[index],
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold), // Customize text style
                    ),
                    onTap: () {
                      // Handle onTap event if needed
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
