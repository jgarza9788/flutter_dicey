import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'themes.dart';
import 'dart:io';

void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => darkMode(),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
//            title: 'Flutter Demo',
            theme: theme,
//            home: new MyHomePage(title: 'Flutter Demo Home Page'),
            initialRoute: Home.id,
              routes: {
                Home.id: (context) => Home(),
                Settings.id: (context) => Settings()
              }
          );
        }
    );
  }
}


class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String themeName = '';

  getThemeName()async{
    themeName = await getStrTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getThemeName();
  }

  @override
  Widget build(BuildContext context){
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => getTheme(themeName),//darkMode(),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
              debugShowCheckedModeBanner: false,
//            title: 'Flutter Demo',
              theme: theme,
//            home: new MyHomePage(title: 'Flutter Demo Home Page'),
              initialRoute: Home.id,
              routes: {
                Home.id: (context) => Home(),
                Settings.id: (context) => Settings()
              }
          );
        }
    );
  }
}

