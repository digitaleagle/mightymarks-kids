import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/ui/star_award.dart';

import 'verse_display.dart';
import 'word_bank.dart';

class GameSelect extends StatefulWidget {
  const GameSelect({Key? key}) : super(key: key);

  @override
  State<GameSelect> createState() => _GameSelectState();
}

class _GameSelectState extends State<GameSelect> {
  GameState state = GameState();

  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    state.listen(() {
      if (state.isVerseComplete && !_isComplete) {
        setState(() {
          _isComplete = true;
        });
      }
    });
  }

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
        title: const Text("Which Game?"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(state.bibleVerse.text),
            Text(state.bibleVerse.reference),
            ElevatedButton(onPressed: () {
              state.pickGame(GameType.quickLearn);
              Navigator.pushNamed(context, "/verse");
            }, child: const Text("Quick Learn")),
            ElevatedButton(onPressed: () {
              state.pickGame(GameType.guided);
              Navigator.pushNamed(context, "/verse");
            }, child: const Text("Guided")),
            ElevatedButton(onPressed: () {
              state.pickGame(GameType.timeOutGuided);
              Navigator.pushNamed(context, "/verse");
            }, child: const Text("Timed Out Guided")),
            ElevatedButton(onPressed: () {
              state.pickGame(GameType.test);
              Navigator.pushNamed(context, "/verse");
            }, child: const Text("Test")),
          ],
        ),
      ),
    );
  }
}
