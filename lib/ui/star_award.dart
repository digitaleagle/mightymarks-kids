import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mighty_marks_kids/data/game_state.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class StarAward extends StatefulWidget {
  const StarAward({Key? key}) : super(key: key);

  @override
  State<StarAward> createState() => _StarAwardState();
}

class _StarAwardState extends State<StarAward>
    with SingleTickerProviderStateMixin {
  GameState state = GameState();
  late AnimationController controller;
  late Animation<double> animation;

  double _star1Size = 0;
  double _star2Size = 0;
  double _star3Size = 0;
  int _currentStar = 1;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    _playAnimation();
  }

  Future<void> _playAnimation() async {
    try {
      _currentStar = 1;
      await controller.forward().orCancel;
      if(state.stars > 1) {
        setState(() {
          _currentStar = 2;
          controller.reset();
        });
        await controller
            .forward()
            .orCancel;
      }
      if(state.stars > 2) {
        setState(() {
          _currentStar = 3;
          controller.reset();
        });
        await controller
            .forward()
            .orCancel;
      }
    } on TickerCanceled {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch(_currentStar) {
      case 1:
        _star1Size = animation.value;
        break;
      case 2:
        _star2Size = animation.value;
        break;
      case 3:
        _star3Size = animation.value;
        break;
    }

    String mistakesText = "No\nMistakes";
    if(state.totalWrongGuesses == 1) {
      mistakesText = "1 Mistake";
    } else if(state.totalWrongGuesses > 1) {
      mistakesText = "${state.totalWrongGuesses}\nMistakes";
    }
    String helpsText = "No\nHelps";
    if(state.totalHelps == 1) {
      helpsText = "1 Help";
    } else if(state.totalHelps > 1) {
      helpsText = "${state.totalHelps}\nHelps";
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RotationTransition(
                turns: _currentStar == 1 ? Tween(begin: 0.0, end: 1.0).animate(controller) : const AlwaysStoppedAnimation(0),
                child: FractionallySizedBox(
                  //heightFactor: animation.value,
                  widthFactor: _star1Size,
                  child: SvgPicture.asset(
                    "images/star.svg",
                  ),
                ),
              ),
              Center(
                  child: Text(
                "Verse\nComplete",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: globals.settings.fontSize, color: Colors.white),
              )),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RotationTransition(
                turns: _currentStar == 3 ? Tween(begin: 0.0, end: 1.0).animate(controller) : const AlwaysStoppedAnimation(0),
                child: FractionallySizedBox(
                  //heightFactor: animation.value,
                  widthFactor: _star3Size,
                  child: SvgPicture.asset(
                    "images/star.svg",
                  ),
                ),
              ),
              Center(
                  child: Text(
                    mistakesText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: globals.settings.fontSize, color: Colors.white),
                  )),
              Visibility(
                visible: state.gameType == GameType.timeOutGuided,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: ElevatedButton(
                          onPressed: () {
                            state.pickGame(GameType.test);
                            Navigator.pushReplacementNamed(context, "/verse");
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle:TextStyle(
                              fontSize: globals.settings.fontSize,
                            ),
                          ),
                          child: const Text("Take the Test")
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RotationTransition(
                turns: _currentStar == 2 ? Tween(begin: 0.0, end: 1.0).animate(controller) : const AlwaysStoppedAnimation(0),
                child: FractionallySizedBox(
                  //heightFactor: animation.value,
                  widthFactor: _star2Size,
                  child: SvgPicture.asset(
                    "images/star.svg",
                  ),
                ),
              ),
              Center(
                  child: Text(
                    helpsText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: globals.settings.fontSize, color: Colors.white),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
