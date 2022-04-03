import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class BasicAward extends StatelessWidget {
  GameState _state = GameState();

  @override
  Widget build(BuildContext context) {
    var nextLabel = "";
    if(_state.gameType == GameType.quickLearn) {
      nextLabel = "Guided";
    }
    if(_state.gameType == GameType.guided) {
      nextLabel = "Timed Guided";
    }

    return Row(
      children: [
        const Spacer(),
        const Icon(Icons.thumb_up, size: 100),
        const Spacer(),
        Column(
          children: [
            const Spacer(),
            Text("Good Job!",
              style: TextStyle(
                fontSize: globals.settings.fontSize * 2,
              ),
            ),
            Text("now try ...",
              style: TextStyle(
                fontSize: globals.settings.fontSize,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if(_state.gameType == GameType.quickLearn) {
                    _state.pickGame(GameType.guided);
                  } else if(_state.gameType == GameType.guided) {
                    _state.pickGame(GameType.timeOutGuided);
                  }
                  Navigator.pushReplacementNamed(context, "/verse");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle:TextStyle(
                    fontSize: globals.settings.fontSize,
                  ),
                ),
                child: Text(nextLabel)
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ],
    );
  }

}