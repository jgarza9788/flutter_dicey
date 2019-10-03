import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'themes.dart';
import 'constants.dart';



class Settings extends StatelessWidget {
  static String id = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.purple,
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ThemeButton(
            themeName: 'DarkMode',
            colors: [Colors.blue,Colors.white,Colors.black],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(ThemeData.dark());
            },
          ),
          ThemeButton(
            themeName: 'Red And Dark',
            colors: [Colors.red,Colors.grey[900],Colors.black],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(redAndDark());
            },
          ),
          ThemeButton(
            themeName: 'Blue And Dark',
            colors: [Colors.blue,Colors.grey[900],Colors.black],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(blueAndDark());
            },
          ),
          ThemeButton(
            themeName: 'Toxic',
            colors: [Colors.lightGreen,Colors.lightGreenAccent,Colors.black],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(toxic());
            },
          ),
          ThemeButton(
            themeName: 'Blue-Steel',
            colors: [Colors.blueGrey[900],Colors.blueGrey,Colors.grey[300]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(blueSteel());
            },
          ),
        ],
      )
    );
  }
}

