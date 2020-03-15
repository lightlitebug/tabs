import 'package:flutter/material.dart';

class TabcontrollerCustomTabbarTwo extends StatefulWidget {
  TabcontrollerCustomTabbarTwo({Key key}) : super(key: key);

  @override
  _TabcontrollerCustomTabbarTwoState createState() =>
      _TabcontrollerCustomTabbarTwoState();
}

class _TabcontrollerCustomTabbarTwoState
    extends State<TabcontrollerCustomTabbarTwo>
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
        title: Text('Custom Tab'),
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
            color: Colors.white,
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
                controller: _controller,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.deepPurple[700],
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.deepPurple[700],
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
