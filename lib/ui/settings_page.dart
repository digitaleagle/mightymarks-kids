import 'package:flutter/material.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  double _fontSize = globals.settings.FontSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MightyMarks Settings"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            DropdownButtonFormField<String>(
                items: <String>['MightyMarks TechTitans Verses','Glimmers Verses','Demo Verses'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (_){},
            ),
            Slider(
                value: _fontSize,
                min: 10,
                max: 200,
                divisions: 100,
                label: _fontSize.round().toString(),
                onChanged: (double newFontSize) {
              setState(() {
                _fontSize = newFontSize;
              });
            }),
            Text(
              "Verse Font Size",
              style: TextStyle(fontSize: _fontSize)
            ),
            ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Saving..."))
                );
                globals.settings.FontSize = _fontSize;
                globals.settings.save();
                Navigator.pop(context);
              }
            }, child: const Text("Save")),
          ],
        )
      )
    );
  }
}