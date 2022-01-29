import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class WordBank extends StatefulWidget {
  GameState state;

  WordBank(this.state);

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
              style: TextStyle(fontSize: globals.settings.FontSize),
            ),
            labelPadding: EdgeInsets.all(10),
          )));
    }

    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.green,
      child: Wrap(
              children: wordWidgets,
              spacing: 15,
              runSpacing: 15,
            ),
    );
  }
}
