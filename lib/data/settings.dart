import 'package:shared_preferences/shared_preferences.dart';

class MMSettings {
  double fontSize = 24;
  String verseList = "MightyMarks TechTitans Verses";

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("fontSize", fontSize);
    prefs.setString("verseListName", verseList);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    double? tempFontSize = prefs.getDouble("fontSize");
    if(tempFontSize != null) {
      fontSize = tempFontSize;
    }
    String? tempVerseList = prefs.getString("verseListName");
    if(tempVerseList != null) {
      verseList = tempVerseList;
    }
  }
}
