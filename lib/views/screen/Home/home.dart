import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFA2D5C6),
      appBar: AppBar(
        backgroundColor: Color(0xFFA2D5C6),
        title: Text("Home"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            color:Color(0xFFA3DC9A),
            child: Column(
              children: [
                const Icon(Icons.person, color: Color(0xFF4a6a78), size: 40),

                const SizedBox(height: 10),
                Text(
                  "FlexZ",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color:Color(0xFF0F828C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rosdeb koch",
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: Color(0xFF78B9B5),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
