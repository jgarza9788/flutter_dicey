import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Theme.of(context).textTheme.title.color,
        onPressed: (){
          Navigator.pop(context,true);
        },
      ),
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ThemeButton(
            themeName: 'DarkMode',
            colors: [Colors.blue,Colors.grey[900],Colors.white],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(darkMode());
              saveTheme('darkMode');
            },
          ),
          ThemeButton(
            themeName: 'Red And Dark',
            colors: [Colors.red,Colors.grey[900],Colors.grey[700]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(redAndDark());
              saveTheme('redAndDark');
            },
          ),
          ThemeButton(
            themeName: 'Blue And Dark',
            colors: [Colors.blue,Colors.grey[900],Colors.grey[700]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(blueAndDark());
              saveTheme('blueAndDark');
            },
          ),
          ThemeButton(
            themeName: 'Toxic',
            colors: [Colors.lightGreen,Colors.lightGreenAccent,Colors.grey[900]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(toxic());
              saveTheme('toxic');
            },
          ),
          ThemeButton(
            themeName: 'Blue-Steel',
            colors: [Colors.blueGrey[900],Colors.blueGrey,Colors.grey[300]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(blueSteel());
              saveTheme('blueSteel');
            },
          ),
          ThemeButton(
            themeName: 'Purple Rain',
            colors: [Colors.deepPurple[900],Colors.deepPurpleAccent,Colors.deepPurple[100]],
            setTheme: (){
              DynamicTheme.of(context).setThemeData(purpleRain());
              saveTheme('purpleRain');
            },
          ),
        ],
      )
    );
  }
}


