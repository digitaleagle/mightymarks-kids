import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

import 'verse_display.dart';
import 'word_bank.dart';

class VerseDragGame extends StatefulWidget {
  @override
  State<VerseDragGame> createState() => _VerseDragGameState();
}

class _VerseDragGameState extends State<VerseDragGame> {
  GameState state = GameState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "Back to Home",
        ),
        title: Text("Build a Verse"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            VerseDisplay(state),
            Expanded(
              flex: 1,
              child: WordBank(state),
            ),
          ],
        ),
      ),
    );
  }
}