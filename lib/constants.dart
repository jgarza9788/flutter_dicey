import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_dicey/CoinPage.dart';
import 'DicePage.dart';
import 'D20Page.dart';

const kTabPages = <Widget>[
  CoinPage(),
  DicePage(),
  D20Page(),
];


const kTabs = <Widget>[
Tab(
    icon: Icon(MdiIcons.coin,size: 40.0,),
    text: 'Coin',
  ),
Tab(
  icon: Icon(MdiIcons.dice5,size: 40.0,),
  text: 'Dice',
),
Tab(
  icon: Icon(MdiIcons.diceD20,size: 40.0,),
  text: 'D20',
),
];



class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.controller,
    this.text,
  }) : super(key: key);

  final AnimationController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50.0,
              color: Theme.of(context).primaryTextTheme.title.color,
            ),
          ),
          onPressed: (){
            controller.forward(from: 0);
          },
          elevation: 12.0,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
      ),
    );
  }
}


class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key key,
    this.themeName,
    this.colors,
    this.setTheme,
  }) : super(key: key);

  final String themeName;
  final List<Color> colors;
  final Function setTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80.0,
        child: RaisedButton(
            color: colors[0],
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(themeName,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).primaryTextTheme.title.color,
                    ),
                  ),
                ),
                Card(
                  elevation: 12.0,
                  color: Colors.blue,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50.0),
//                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: colors[0],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: colors[1],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: colors[2],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onPressed: setTheme,
            elevation: 6.0,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))
        ),
      ),
    );
  }
}