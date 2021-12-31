import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/word.dart';

import 'message_area.dart';

class VerseDisplay extends StatefulWidget {
  GameState state;

  VerseDisplay(this.state);

  @override
  State<VerseDisplay> createState() => _VerseDisplayState(state);
}

class _VerseDisplayState extends State<VerseDisplay> {
  GameState state;

  _VerseDisplayState(this.state);

  @override
  void initState() {
    this.state.listen(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (Word? data) {
        print("onWillAccept ... $data");
        return true;
      },
      onAccept: (Word data) {
        print("Accepted $data");
        if (this.state.checkWord(data)) {
          this.state.acceptNextWord();
        } else {
          this.state.wrongWord(data);
        }
      },
      builder: (context, candidateData, rejectedData) {
        String displayVerse = "";
        for(Word word in state.answers) {
          if(displayVerse.isNotEmpty) {
            displayVerse += " ";
          }
          displayVerse += word.word;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Text(
                  state.answers.isEmpty ? "Drop Here" : displayVerse,
                  style: TextStyle(
                      fontSize: 24,
                    color: Colors.white
                  ),
                )
            ),
            MessageArea(this.state),
          ],
        );
      },
    );
  }
}
