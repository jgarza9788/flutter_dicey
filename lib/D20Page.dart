import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';

class D20Page extends StatelessWidget {
  const D20Page({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D20();
  }
}

class D20 extends StatefulWidget {
  @override
  _D20State createState() => _D20State();
}

class _D20State extends State<D20> with SingleTickerProviderStateMixin{

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

  double initRotate = 0.0;

  void Roll()
  {
    var rng = new Random();
    setState(() {
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

//    controller.forward(from: 0);
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
                  child: Image.asset(D20[value],
                    color: Theme.of(context).iconTheme.color.withOpacity(animEase.value.clamp(0.0,1.0) ),
                  ),
                )
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 100.0,
            child: RaisedButton(
                child: Text(
                  'Roll',
                  style: TextStyle(fontSize: 50.0),
                ),
//                color: Colors.red,
                onPressed: (){
                  controller.forward(from: 0);
                },
                elevation: 12.0,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
            ),
          ),
        ],
      ),
    );
  }
}
