import 'package:flutter/material.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_outlined),
        title: Text("App"),
      ),
    );
  }
}
