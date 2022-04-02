import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mdi/mdi.dart';
import 'dart:math';
import 'constants.dart';



class DicePage extends StatefulWidget {
  const DicePage({
    Key key,
  }) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin{

  int value = 0;
  List<IconData> Dice = [
    Mdi.dice1,
    Mdi.dice2,
    Mdi.dice3,
    Mdi.dice4,
    Mdi.dice5,
    Mdi.dice6,
  ] ;

  List<int> hist = [];
  List<Widget> historyList = [];
  double initRotate = 0.0;

  void Roll(bool first)
  {
    var rng = new Random();
    setState(() {

      if(!first)
      {
        hist.add(value);
        if(hist.length>7)
        {
          hist.removeAt(0);
        }

        historyList.clear();
        for (int i = 0 ;i < hist.length;i++)
        {
          historyList.add(
              Icon(
                Dice[hist[i]],
                size: 50.0,
                color: Theme.of(context).iconTheme.color.withOpacity( pow(i/hist.length,2) + 0.1 ),
              )
          );
        }
      }

      value = rng.nextInt(6);
      initRotate = (rng.nextDouble()*5.0) - 2.5;
      print('initRotate $initRotate');
    });
  }

  AnimationController controller;
  Animation animEase;
  Animation animBounce;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    //https://api.flutter.dev/flutter/animation/Curves-class.html
    animEase = CurvedAnimation(parent: controller,curve: Curves.ease);
    animBounce = CurvedAnimation(parent: controller,curve: Curves.bounceOut);

    Roll(true);
    controller.forward(from: 0);
//    controller.reverse(from: 1);

    controller.addStatusListener((status){
      print(status);
      //moves between forwards and back

      if(status == AnimationStatus.forward)
      {
        Roll(false);
      }

    });

    controller.addListener((){
      setState(() {
        print(controller.value);
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
            child: Transform.translate(
                offset: Offset(0.0,(animBounce.value*150.0)-125.0),
                child: Transform.rotate(
                  angle: (animBounce.value*initRotate)-initRotate,
                  origin: Offset(0.0,0.0),
                  child: Icon(
                    Dice[value],
                    size: 250,
                    color: Theme.of(context).iconTheme.color.withOpacity(animEase.value.clamp(0.0,1.0) ),
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
            child: Container(
                height: 50.0,
                child: Opacity(
                  opacity: sin(animEase.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: historyList,
                  ),
                )
            ),
          ),
          ActionButton(controller: controller,text: 'Roll',),
        ],
      ),
    );
  }
}
