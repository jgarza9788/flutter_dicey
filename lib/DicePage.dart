import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'constants.dart';

class DicePage extends StatelessWidget {
  const DicePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dice();
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin{

  int value = 0;
  List<IconData> Dice = [
    MdiIcons.dice1,
    MdiIcons.dice2,
    MdiIcons.dice3,
    MdiIcons.dice4,
    MdiIcons.dice5,
    MdiIcons.dice6,
  ] ;

  double initRotate = 0.0;

  void Roll()
  {
    var rng = new Random();
    setState(() {
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

    Roll();
    controller.forward(from: 0);
//    controller.reverse(from: 1);

    controller.addStatusListener((status){
      print(status);
      //moves between forwards and back

      if(status == AnimationStatus.forward)
      {
        Roll();
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
                offset: Offset(0.0,(animBounce.value*150.0)-150.0),
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
          SizedBox(
            height: 25.0,
          ),
          ActionButton(controller: controller,text: 'Roll',),
        ],
      ),
    );
  }
}
