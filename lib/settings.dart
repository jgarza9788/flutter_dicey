import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';


_saveValue(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int dark = (prefs.getInt('dark') ?? 0) + 1;
  print('dark $dark');
  await prefs.setInt('dark', dark);
}


class Settings extends StatelessWidget {
  static String id = 'settings';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Dark Mode'),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: _saveValue,
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}