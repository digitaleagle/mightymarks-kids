import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

class MessageArea extends StatefulWidget {
  GameState state;

  MessageArea(this.state);

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          widget.state.message,
          style: TextStyle(fontSize: 20),
        ),
      )
    );
  }

  @override
  void initState() {
    widget.state.listen(() {
      setState(() {});
    });
  }
}