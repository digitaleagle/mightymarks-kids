import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/ui/star_award.dart';

import 'verse_display.dart';
import 'word_bank.dart';

class VerseDragGame extends StatefulWidget {
  const VerseDragGame({Key? key}) : super(key: key);

  @override
  State<VerseDragGame> createState() => _VerseDragGameState();
}

class _VerseDragGameState extends State<VerseDragGame> {
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
        title: const Text("Build a Verse"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
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
          _isComplete ? const StarAward() : Container(),
        ],
      ),
    );
  }
}
