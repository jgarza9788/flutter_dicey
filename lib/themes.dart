import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {

  static int index = 0 ;

  List<String> themeNames = [
    'Dark',
    'Red',
    'Blue',
    'Toxic',
    'Blue Steal',
    'Purple Rain',
  ];

  List<ThemeData> themelist = <ThemeData>[
    darkTheme, //0
    redTheme, //1
    blueTheme, //2
    toxicTheme, //3
    blueSteelTheme, //4
    purpleRainTheme //5
  ];
  ThemeData get currentTheme => themelist[index % themelist.length];

  void toggleTheme() {
    // _isDarkTheme = !_isDarkTheme;
    index += 1;
    notifyListeners();
  }

  void setTheme(int i){
    index = i;
    notifyListeners();
    _save_theme(i);
  }

  // @override
  // void initState() {
  //   getTheme();
  // }

  void getTheme() async {
    // print(_load_theme().toString());
    index = await _load_theme();
    print(index.toString());
    notifyListeners();
  }

  _save_theme(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_index', i);
  }

  _load_theme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('theme_index') ?? 0;
  }


  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      accentColor: Colors.blueAccent,
    );
  }

  static ThemeData get redTheme {
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
        title: TextStyle(color: Colors.black,
            fontWeight:FontWeight.bold
        ),
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
          title: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontSize: 23,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData get blueTheme {
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
        title: TextStyle(
            color: Colors.black,
            fontWeight:FontWeight.bold
        ),
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
          title: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontSize: 23,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData get toxicTheme {
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
        title: TextStyle(
            color: Colors.black,
            fontWeight:FontWeight.bold
        ),
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
          title: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontSize: 23,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData get blueSteelTheme {
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
        title: TextStyle(
            color: Colors.grey,
            fontWeight:FontWeight.bold
        ),
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
          title: TextStyle(
            color: Colors.grey,
            fontWeight:FontWeight.bold,
            fontSize: 23,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }

  static ThemeData get purpleRainTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.deepPurple,
      accentColor: Colors.purple[100],
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
        title: TextStyle(
            color: Colors.grey[200],
            fontWeight:FontWeight.bold),
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
          title: TextStyle(
            color: Colors.deepPurple[100],
            fontWeight:FontWeight.bold,
            fontSize: 23,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.deepPurple[100],
        ),
      ),
    );
  }



}