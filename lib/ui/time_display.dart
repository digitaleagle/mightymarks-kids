import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

class TimeDisplay extends StatefulWidget {
  @override
  State<TimeDisplay> createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Timer _timer;
  var _seconds = 0;
  final GameState _state = GameState();
  
  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if(_state.isVerseComplete) {
          timer.cancel();
        } else {
          _seconds++;
          _state.gameTime = _seconds;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
        child: Text(_seconds.toString(),
          style: const TextStyle(fontSize: 25),
        )
    );
  }
}