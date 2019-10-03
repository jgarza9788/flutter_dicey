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
//            color: colors[0],
            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(themeName,
                    style: TextStyle(
                      fontSize: 20.0,
//                      color: Theme.of(context).primaryTextTheme.title.color,
                      color: Colors.grey[900]
                    ),
                  ),
                ),
                ThemePreview(colors: colors,),
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

class ThemePreview extends StatelessWidget {
  const ThemePreview({
    Key key,
    this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 50.0,
          decoration: new BoxDecoration(
            color: colors[0],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
        Container(
          width: 33.0,
          height: 33.0,
          decoration: new BoxDecoration(
            color: colors[1],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
        Container(
          width: 16.5,
          height: 16.5,
          decoration: new BoxDecoration(
            color: colors[2],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

