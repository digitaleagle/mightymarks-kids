import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class StarAward extends StatefulWidget {
  @override
  State<StarAward> createState() => _StarAwardState();
}

class _StarAwardState extends State<StarAward>
    with SingleTickerProviderStateMixin {
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
      setState(() {
        _currentStar = 2;
        controller.reset();
      });
      await controller.forward().orCancel;
      setState(() {
        _currentStar = 3;
        controller.reset();
      });
      await controller.forward().orCancel;
    } on TickerCanceled {}
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RotationTransition(
                turns: _currentStar == 1 ? Tween(begin: 0.0, end: 1.0).animate(controller) : AlwaysStoppedAnimation(0),
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
                style: TextStyle(fontSize: globals.settings.FontSize, color: Colors.blue),
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
                turns: _currentStar == 3 ? Tween(begin: 0.0, end: 1.0).animate(controller) : AlwaysStoppedAnimation(0),
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
                    "No\nMistakes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: globals.settings.FontSize, color: Colors.blue),
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              RotationTransition(
                turns: _currentStar == 2 ? Tween(begin: 0.0, end: 1.0).animate(controller) : AlwaysStoppedAnimation(0),
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
                    "No\nHelps",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: globals.settings.FontSize, color: Colors.blue),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
