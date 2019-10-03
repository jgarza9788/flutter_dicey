import 'package:flutter/material.dart';



ThemeData redAndDark() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.red,
    accentColor: Colors.black,
    canvasColor: Colors.grey[900],
    backgroundColor: Colors.grey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
      shape: RoundedRectangleBorder(),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.black,fontSize: 50.0,fontWeight:FontWeight.bold),
    ),
    indicatorColor: Colors.redAccent,
    iconTheme: IconThemeData(
      color: Colors.grey[600]
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.red,
      unselectedLabelColor: Colors.grey[700],
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
          fontSize: 24.0
      ),
    ),
);
}

ThemeData blueAndDark() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    accentColor: Colors.black,
    canvasColor: Colors.grey[900],
    backgroundColor: Colors.grey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      shape: RoundedRectangleBorder(),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.black,fontSize: 50.0,fontWeight:FontWeight.bold),
    ),
    indicatorColor: Colors.blueAccent,
    iconTheme: IconThemeData(
        color: Colors.grey[600]
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey[700],
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
          fontSize: 24.0
      ),
    ),
  );
}

ThemeData toxic() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.lightGreen,
    accentColor: Colors.black,
    canvasColor: Colors.grey[900],
    backgroundColor: Colors.grey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightGreen,
      shape: RoundedRectangleBorder(),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.black,fontSize: 50.0,fontWeight:FontWeight.bold),
    ),
    indicatorColor: Colors.lightGreenAccent,
    iconTheme: IconThemeData(
        color: Colors.grey[600]
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.lightGreen,
      unselectedLabelColor: Colors.grey[700],
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
          fontSize: 24.0
      ),
    ),
  );
}


ThemeData blueSteel() {
  return ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[700],
    accentColor: Colors.black,
    canvasColor: Colors.blueGrey[900],
    backgroundColor: Colors.grey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey[900],
      shape: RoundedRectangleBorder(),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.grey,fontSize: 50.0,fontWeight:FontWeight.bold),
    ),
    indicatorColor: Colors.blueGrey,
    iconTheme: IconThemeData(
        color: Colors.blueGrey[500]
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.blueGrey,
      unselectedLabelColor: Colors.grey[700],
    ),
    appBarTheme: AppBarTheme().copyWith(
      textTheme: TextTheme().copyWith(
        title: TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight:FontWeight.bold),
      ),
      iconTheme: IconThemeData().copyWith(
        color: Colors.grey,
      ),
    ),
    textTheme: TextTheme().copyWith(
      body1: TextStyle(
          fontSize: 24.0
      ),
    ),
  );
}
