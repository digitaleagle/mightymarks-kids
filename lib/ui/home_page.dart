import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GameState state = GameState();

    return Scaffold(
      appBar: AppBar(
        title: const Text("MightyMarks"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings").then((value) {
                  setState(() {
                    print("refreshing");
                  });
                });
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView.builder(
        itemCount: state.verses.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.verses.list[index].reference),
            onTap: () {
              state.pickVerse(state.verses.list[index]);
              Navigator.pushNamed(context, "/verse");
            },
          );
        },
      ),
    );
  }
}
