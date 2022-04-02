import 'package:flutter/material.dart';
import 'package:dice/home.dart';
import 'package:dice/themes.dart';
import 'package:dice/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });

    currentTheme.getTheme();
  }

  @override
  Widget build(BuildContext context) {

  return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme.currentTheme,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Settings.id: (context) => Settings(),
      }
  );

  }
}
