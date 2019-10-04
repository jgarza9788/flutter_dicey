import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'constants.dart';
import 'themes.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Coin();
  }
}

class Coin extends StatefulWidget {
  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> with SingleTickerProviderStateMixin{

  int value = 0;
  List<IconData> coin = [
    MdiIcons.alphaHCircle,
    MdiIcons.alphaTCircle
  ] ;

  List<Widget> historyList = [];

  void Flip(bool first)
  {
    var rng = new Random();
    setState(() {

      if (!first)
      {
        historyList.add(
            Icon(
              coin[value],
              size: 50.0,
              color: Theme.of(context).iconTheme.color.withOpacity(0.125),
            )
        );

        if (historyList.length > 7)
        {
          historyList.removeAt(0);
        }
      }
      print(historyList);


      value = rng.nextInt(2);
    });
  }


  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    //https://api.flutter.dev/flutter/animation/Curves-class.html
    animation = CurvedAnimation(parent: controller,curve: Curves.easeIn);

    Flip(true);
    controller.forward(from: 0);
//    controller.reverse(from: 1);

    animation.addStatusListener((status){
      print(status);
      //moves between forwards and back
      if(status == AnimationStatus.forward)
      {
          Flip(false);
      }

    });

    controller.addListener((){
      setState(() {
//        print(controller.value);
//        print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Transform(
                  transform: Matrix4.rotationX(1.5-(animation.value*1.5))..translate(0.0,(animation.value*150.0)-125.0),
                  child: Icon(
                    coin[value],
                    size: 250,
                    color: Theme.of(context).iconTheme.color.withOpacity(animation.value.clamp(0.0,1.0) ),
                  )
              ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
              child: Container(
                height: 50.0,
                child: Opacity(
                  opacity: sin(animation.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: historyList,
                  ),
                )
              ),
            ),
            ActionButton(controller: controller,text: 'Flip',),
          ],
        ),
      );
  }
}

