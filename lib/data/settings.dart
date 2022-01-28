import 'package:shared_preferences/shared_preferences.dart';

class MMSettings {
  double FontSize = 24;
  String VerseList = "MightyMarks TechTitans Verses";

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("fontSize", FontSize);
    prefs.setString("verseListName", VerseList);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    double? tempFontSize = prefs.getDouble("fontSize");
    if(tempFontSize != null) {
      FontSize = tempFontSize;
    }
    String? tempVerseList = prefs.getString("verseListName");
    if(tempVerseList != null) {
      VerseList = tempVerseList;
    }
  }
}
