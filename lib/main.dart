import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'themes.dart';
import 'dart:io';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              theme: theme,
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

