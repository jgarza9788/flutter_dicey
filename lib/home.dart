
import 'package:flutter/material.dart';
// import 'package:flutter_dicey/CoinPage.dart';
// import 'package:flutter_dicey/DicePage.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mdi/mdi.dart';
import 'constants.dart';
import 'settings.dart';


class Home extends StatelessWidget {
  static String id = 'home';

  Home({this.result});

  final result;

  @override
  Widget build(BuildContext context) {
    return HomeContent(result: result,);
  }
}

class HomeContent extends StatefulWidget {
  static String id = 'home';
  HomeContent({this.result});

  final result;

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
        title: Text('Dicey'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Mdi.cog,
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

