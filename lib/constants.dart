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



