import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'constants.dart';



class D20Page extends StatefulWidget {
  const D20Page({
    Key key,
  }) : super(key: key);


  @override
  _D20PageState createState() => _D20PageState();
}

class _D20PageState extends State<D20Page> with SingleTickerProviderStateMixin{

  int value = 0;
  List<String> D20 =[
    'images/D20_01.png',
    'images/D20_02.png',
    'images/D20_03.png',
    'images/D20_04.png',
    'images/D20_05.png',
    'images/D20_06.png',
    'images/D20_07.png',
    'images/D20_08.png',
    'images/D20_09.png',
    'images/D20_10.png',
    'images/D20_11.png',
    'images/D20_12.png',
    'images/D20_13.png',
    'images/D20_14.png',
    'images/D20_15.png',
    'images/D20_16.png',
    'images/D20_17.png',
    'images/D20_18.png',
    'images/D20_19.png',
    'images/D20_20.png',
  ];

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
            Image.asset(D20[hist[i]],
                color: Theme.of(context).iconTheme.color.withOpacity( pow(i/hist.length,2) + 0.1 ),
            ),
          );
        }
      }

      value = rng.nextInt(20);
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
                  child: Image.asset(D20[value],
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
