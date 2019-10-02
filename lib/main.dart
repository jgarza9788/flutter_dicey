import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'constants.dart';
import 'home.dart';
import 'settings.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightGreen,
          accentColor: Colors.lightGreenAccent,
          buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightGreen,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
          ),
          indicatorColor: Colors.lightGreenAccent,
          iconTheme: IconThemeData(
          color: Colors.grey
          ),
          tabBarTheme: TabBarTheme(
              labelColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.grey,
        ),
        appBarTheme: AppBarTheme().copyWith(
          textTheme: TextTheme().copyWith(
            title: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight:FontWeight.bold),
          ),
          iconTheme: IconThemeData().copyWith(
            color: Colors.black,
          ),
        ),
          textTheme: TextTheme().copyWith(
            body1: TextStyle(
//              color: Colors.red,
                fontSize: 24.0

            ),
          ),

        ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          Settings.id: (context) => Settings()
        }
    );


  }
}

