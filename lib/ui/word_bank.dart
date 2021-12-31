import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mighty_marks_kids/data/game_state.dart';

class WordBank extends StatefulWidget {
  GameState state;

  WordBank(this.state);

  @override
  State<StatefulWidget> createState() {
    return WordBankState(this.state);
  }
}

class WordBankState extends State {
  GameState state;

  WordBankState(this.state);

  @override
  void initState() {
    this.state.listen(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> wordWidgets = [];
    for (var word in this.state.bank) {
      wordWidgets.add(Draggable(
          data: word,
          axis: Axis.vertical,
          feedback: Material(
            child: Chip(label: Text(word.word)),
          ),
          child: Chip(
              label: Text(
                  word.word,
                style: TextStyle(fontSize: 24),
              ),
            labelPadding: EdgeInsets.all(10),
          )
      ));
    }

    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.green,
      child: state.isVerseComplete ?
        SvgPicture.asset(
            "images/star.svg",
        )
      :
        Wrap(
        children: wordWidgets,
        spacing: 15,
        runSpacing: 15,
      ),
    );
  }
}
