import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class WordBank extends StatefulWidget {
  final GameState state;

  const WordBank(this.state, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WordBankState();
  }
}

class WordBankState extends State<WordBank> {

  @override
  void initState() {
    super.initState();
    widget.state.listen(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> wordWidgets = [];
    for (var word in widget.state.bank) {
      wordWidgets.add(Draggable(
          data: word,
          axis: Axis.vertical,
          feedback: Material(
            child: Chip(label: Text(word.word)),
          ),
          child: Chip(
            label: Text(
              word.word,
              style: TextStyle(fontSize: globals.settings.fontSize),
            ),
            labelPadding: const EdgeInsets.all(10),
          )));
    }

    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.green,
      child: Wrap(
              children: wordWidgets,
              spacing: 15,
              runSpacing: 15,
            ),
    );
  }
}
