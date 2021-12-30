import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameState state = GameState();

    return Scaffold(
      appBar: AppBar(
        title: Text("MightyMarks"),
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
