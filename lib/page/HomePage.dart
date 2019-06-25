import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/page/PageOne.dart';
import 'package:flutter_app/page/PageTwo.dart';
import 'package:flutter_app/page/PageThree.dart';
import 'package:flutter_app/page/PageFour.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> _title = ["PageOne", "PageTwo", "PageThree", "PageFour"];
  int _currentIndex = 0;
  PageController _mPageController = new PageController();

  String _homeTitle = "pageOne";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_homeTitle),
        centerTitle: true,
      ),
      body: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _mPageController,
        children: <Widget>[PageOne(), PageTwo(), PageThree(), PageFour()],
        onPageChanged: (index) {
          _currentIndex = index;
          _homeTitle = _title[index];
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              title: Text("item1"),
              icon: Icon(Icons.ac_unit),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text("item2"),
              icon: Icon(Icons.backup),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text("item3"),
              icon: Icon(Icons.cake),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text("item4"),
              icon: Icon(Icons.dashboard),
              backgroundColor: Colors.blue),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          _mPageController.jumpToPage(index);
          _homeTitle = _title[index];
          setState(() {});
        },
      ),
    );
  }
}
