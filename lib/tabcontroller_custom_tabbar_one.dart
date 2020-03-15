import 'package:flutter/material.dart';

class TabcontrollerCustomTabbarOne extends StatefulWidget {
  @override
  _TabcontrollerCustomTabbarOneState createState() =>
      _TabcontrollerCustomTabbarOneState();
}

class _TabcontrollerCustomTabbarOneState
    extends State<TabcontrollerCustomTabbarOne>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('지도에서 찾기'),
          SizedBox(width: 10.0),
          Icon(Icons.location_on),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('주소 입력'),
          SizedBox(width: 10.0),
          Icon(Icons.location_searching),
        ],
      ),
    ),
  ];

  TabController _controller;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: myTabs.length,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom TabBar'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.yellow[200],
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'HEADER',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.deepPurple[700],
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
                controller: _controller,
                labelColor: Colors.deepPurple[700],
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                tabs: myTabs,
                onTap: (int currentTab) {
                  setState(() => selectedTab = currentTab);
                }),
          ),
          Container(
            width: double.infinity,
            height: 300.0,
            child: TabBarView(
              controller: _controller,
              children: myTabs.map((Tab tab) {
                return Container(
                  width: double.infinity,
                  height: 300.0,
                  color: selectedTab == 0 ? Colors.blue : Colors.indigo,
                );
              }).toList(),
            ),
          ),
          Container(
            color: Colors.teal[200],
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'BOTTOM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
