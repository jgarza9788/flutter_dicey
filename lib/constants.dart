import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:dice/CoinPage.dart';
import 'package:dice/DicePage.dart';
import 'D20Page.dart';


const kTabPages = <Widget>[

  CoinPage(),
  DicePage(),
  D20Page(),

];


const kTabs = <Widget>[
custTab(
  icon: Icon(Mdi.alphaHCircle,size: 30.0,),
  text: 'Coin',
),
custTab(
  icon: Icon(Mdi.dice5,size: 30.0,),
  text: 'Coin',
),
custTab(
  icon: Icon(Mdi.diceD20,size: 30.0,),
  text: 'Coin',
),

// Tab(
//     icon: Icon(Mdi.alphaHCircle,size: 30.0,),
//     text: 'Coin',
// ),
// Tab(
//   icon: Icon(Mdi.dice5,size: 30.0,),
//   text: 'Dice',
// ),
// Tab(
//   icon: Icon(Mdi.diceD20,size: 30.0,),
//   text: 'D20',
// ),
];

class custTab extends StatelessWidget {
  const custTab({
    Key key,
    this.icon = const Icon(Mdi.circle,size: 30.0,),
    this.text = '',
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child:Tab(
      child:Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          // fix: StackFit.loose,
          children: [
            Positioned(
                top: 10.0,
                // right: 0.0,
                child: icon
            ),
            Positioned(
              top: 40.0,
              // right: 0.0,
              child: Text(text),
            ),

          ],
        )
    ),
    );

    // return Stack(
    //   alignment: AlignmentDirectional.center,
    //   clipBehavior: Clip.none,
    //   // fix: StackFit.loose,
    //   children: [
    //     Positioned(
    //         child: icon
    //     ),
    //     Positioned(
    //       top: 30.0,
    //       right: 0.0,
    //       child: Text(text),
    //     ),
    //
    //     // Icon(Mdi.alphaHCircle,size: 30.0,),
    //     // Positioned(
    //       // height: 50.0,
    //       // alignment: Alignment.center,
    //       // right: 250.0,
    //       // child:
    //
    //     // )
    //   ],
    // );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     icon,
    //     Text(text),
    //   ],
    // );
  }
}



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
    this.onTap,
  }) : super(key: key);

  final String themeName;
  final List<Color> colors;
  final Function onTap;

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
            onPressed: onTap,
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

