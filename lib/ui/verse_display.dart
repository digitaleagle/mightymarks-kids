import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/word.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

import 'message_area.dart';

class VerseDisplay extends StatefulWidget {
  GameState state;

  VerseDisplay(this.state);

  @override
  State<VerseDisplay> createState() => _VerseDisplayState();
}

class _VerseDisplayState extends State<VerseDisplay> {
  _VerseDisplayState();

  @override
  void initState() {
    super.initState();
    widget.state.listen(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (Word? data) {
        // There are no other things being dragged, so we are always going to
        // return true.
        return true;
      },
      onAccept: (Word data) {
        // The word was dropped.  Now, we need to see if it is the right word
        // or not.
        if (widget.state.checkWord(data)) {
          widget.state.acceptNextWord();
        } else {
          widget.state.wrongWord(data);
        }
      },
      builder: (context, candidateData, rejectedData) {
        // This builder displays what goes into the drag target
        String displayVerse = "";
        for(Word word in widget.state.answers) {
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
                decoration: BoxDecoration(
                  border: candidateData.isNotEmpty ? Border.all(
                    width: 5.0,
                    color: Colors.red,
                  ) : null,
                  color: Colors.blue,
                ),
                child: Text(
                  widget.state.answers.isEmpty ? "Drop Here" : displayVerse,
                  style: TextStyle(
                      fontSize: globals.settings.FontSize,
                    color: Colors.white
                  ),
                )
            ),
            MessageArea(widget.state),
          ],
        );
      },
    );
  }
}
