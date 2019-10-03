import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
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

