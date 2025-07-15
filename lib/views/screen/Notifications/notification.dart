import 'package:flutter/material.dart';
class Notificationes extends StatelessWidget {
  const Notificationes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: Icon(Icons.arrow_back_ios_outlined),
        title: Text("Notification"),
      ),
    );
  }
}
