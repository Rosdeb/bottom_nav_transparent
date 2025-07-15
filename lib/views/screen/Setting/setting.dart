import 'package:flutter/material.dart';
class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.green,
        leading: Icon(Icons.arrow_back_ios_outlined),
        title: Text("Setting"),

      ),
    );
  }
}
