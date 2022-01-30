import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/ui/home_page.dart';
import 'package:mighty_marks_kids/ui/settings_page.dart';
import 'package:mighty_marks_kids/ui/verse_drag_game.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

void main() {
  globals.settings.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MightyMarks',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color.fromRGBO(104, 142, 176, 1)),
        fontFamily: 'Luckiest Guy'
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/verse': (context) => const VerseDragGame(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }

  // from -- https://stackoverflow.com/questions/50549539/how-to-add-custom-color-to-flutter
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
