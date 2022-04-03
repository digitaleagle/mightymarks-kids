import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/ui/time_display.dart';

class MessageArea extends StatefulWidget {
  final GameState state;

  const MessageArea({Key? key, required this.state}) : super(key : key);

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeDisplay(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.state.message,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.state.listen(() {
      setState(() {});
    });
  }
}