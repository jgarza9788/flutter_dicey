import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

saveTheme(themeName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('theme: $themeName');
  await prefs.setString('themeName', themeName);
}

Future<String> getStrTheme() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String themeName = prefs.getString('themeName');
  print('theme: $themeName');
  return themeName;
}

ThemeData getTheme(themeName){

    if (themeName == 'redAndDark')
    {
//      DynamicTheme.of(context).setThemeData(redAndDark());
  return redAndDark();
    }
  else if (themeName == 'blueAndDark')
    {
//      DynamicTheme.of(context).setThemeData(blueAndDark());
      return blueAndDark();
    }
  else if (themeName == 'toxic')
  {
//    DynamicTheme.of(context).setThemeData(toxic());
  return toxic();
  }
  else if (themeName == 'blueSteel')
  {
//    DynamicTheme.of(context).setThemeData(blueSteel());
  return blueAndDark();
  }
  else if (themeName == 'purpleRain')
  {
//    DynamicTheme.of(context).setThemeData(purpleRain());
  return purpleRain();
  }
  else
  {
//    DynamicTheme.of(context).setThemeData(darkMode());
  return darkMode();
  }
}


ThemeData darkMode() {
  return ThemeData.dark().copyWith(
    indicatorColor: Colors.blue,
  );
}

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


ThemeData purpleRain() {
  return ThemeData.light().copyWith(
    primaryColor: Colors.deepPurple,
    accentColor: Colors.deepPurple,
    canvasColor: Colors.deepPurple[200],
    backgroundColor: Colors.deepPurple,
    splashColor: Colors.deepPurple[900],
    scaffoldBackgroundColor: Colors.deepPurple[200],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepPurple[900],
      splashColor: Colors.deepPurpleAccent[100],
      shape: RoundedRectangleBorder(),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.grey[200],fontSize: 50.0,fontWeight:FontWeight.bold),
    ),
    indicatorColor: Colors.deepPurpleAccent,
    iconTheme: IconThemeData(
        color: Colors.deepPurple,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.deepPurple[900],
      unselectedLabelColor: Colors.deepPurpleAccent[200],
    ),
    appBarTheme: AppBarTheme().copyWith(
      textTheme: TextTheme().copyWith(
        title: TextStyle(color: Colors.deepPurple[100],fontSize: 20.0,fontWeight:FontWeight.bold),
      ),
      iconTheme: IconThemeData().copyWith(
        color: Colors.deepPurple[100],
      ),
    ),
    textTheme: TextTheme().copyWith(
      body1: TextStyle(
          fontSize: 24.0
      ),
    ),
  );
}


