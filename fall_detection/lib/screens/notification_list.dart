import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.builder(
        itemCount: 10, // 10 dummy notifications
        itemBuilder: (context, index) {
          return ListTile(title: Text('Fall Detected'));
        },
      ),
    );
  }
}
