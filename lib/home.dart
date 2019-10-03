import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'constants.dart';

import 'settings.dart';

class Home extends StatelessWidget {
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return HomeContent();
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//          leading: Icon(MdiIcons.dice1),
        title: Text('Dicey'),
//      backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(MdiIcons.settings,
//              color: Colors.grey[200],
              ),
              onPressed: () {
                Navigator.pushNamed(context, Settings.id);
              }
          )
        ],
      ),
      body: TabBarView(
        children: kTabPages,
        controller: _tabController,
      ),
    bottomNavigationBar: Material(
      color: Theme.of(context).canvasColor,
      child: TabBar(
        tabs: kTabs,
        indicatorWeight: 2.0,
        controller: _tabController,
      ),
    ),

    );
  }
}

