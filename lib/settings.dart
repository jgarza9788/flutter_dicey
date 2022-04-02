import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:dice/themes.dart';
import 'package:dice/constants.dart';



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
            themeName: currentTheme.themeNames[0],
            // colors: [Colors.blue,Colors.grey[900],Colors.white],
            colors: [
              currentTheme.themelist[0].canvasColor,
              currentTheme.themelist[0].accentColor,
              currentTheme.themelist[0].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(0);
              Navigator.pop(context,true);
            },
          ),
          ThemeButton(
            themeName: currentTheme.themeNames[1],
            // colors: [Colors.blue,Colors.grey[900],Colors.white],
            colors: [
              currentTheme.themelist[1].canvasColor,
              currentTheme.themelist[1].accentColor,
              currentTheme.themelist[1].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(1);
              Navigator.pop(context,true);
            },
          ),
          ThemeButton(
            themeName: currentTheme.themeNames[2],
            colors: [
              currentTheme.themelist[2].canvasColor,
              currentTheme.themelist[2].accentColor,
              currentTheme.themelist[2].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(2);
              Navigator.pop(context,true);
            },
          ),

          ThemeButton(
            themeName: currentTheme.themeNames[3],
            colors: [
              currentTheme.themelist[3].canvasColor,
              currentTheme.themelist[3].accentColor,
              currentTheme.themelist[3].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(3);
              Navigator.pop(context,true);
            },
          ),

          ThemeButton(
            themeName: currentTheme.themeNames[4],
            colors: [
              currentTheme.themelist[4].canvasColor,
              currentTheme.themelist[4].accentColor,
              currentTheme.themelist[4].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(4);
              Navigator.pop(context,true);
            },
          ),

          ThemeButton(
            themeName: currentTheme.themeNames[5],
            // colors: [Colors.blue,Colors.grey[900],Colors.white],
            colors: [
              currentTheme.themelist[5].canvasColor,
              currentTheme.themelist[5].accentColor,
              currentTheme.themelist[5].primaryColor,
            ],
            onTap: (){
              currentTheme.setTheme(5);
              Navigator.pop(context,true);
            },
          ),
          // ThemeButton(
          //   themeName: 'Red And Dark',
          //   colors: [Colors.red,Colors.grey[900],Colors.grey[700]],
          //   onTap: (){
          //     currentTheme.setTheme(1);
          //   },
          // ),
          // ThemeButton(
          //   themeName: 'Blue And Dark',
          //   colors: [Colors.blue,Colors.grey[900],Colors.grey[700]],
          //   // setTheme: (){
          //   //   DynamicTheme.of(context).setThemeData(blueAndDark());
          //   //   saveTheme('blueAndDark');
          //   // },
          // ),
          // ThemeButton(
          //   themeName: 'Toxic',
          //   colors: [Colors.lightGreen,Colors.lightGreenAccent,Colors.grey[900]],
          //   // setTheme: (){
          //   //   DynamicTheme.of(context).setThemeData(toxic());
          //   //   saveTheme('toxic');
          //   // },
          // ),
          // ThemeButton(
          //   themeName: 'Blue-Steel',
          //   colors: [Colors.blueGrey[900],Colors.blueGrey,Colors.grey[300]],
          //   // setTheme: (){
          //   //   DynamicTheme.of(context).setThemeData(blueSteel());
          //   //   saveTheme('blueSteel');
          //   // },
          // ),
          // ThemeButton(
          //   themeName: 'Purple Rain',
          //   colors: [Colors.deepPurple[900],Colors.deepPurpleAccent,Colors.deepPurple[100]],
          //   // setTheme: (){
          //   //   DynamicTheme.of(context).setThemeData(purpleRain());
          //   //   saveTheme('purpleRain');
          //   // },
          // ),
        ],
      )
    );
  }
}



