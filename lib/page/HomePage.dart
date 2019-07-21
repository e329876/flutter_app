import 'package:flutter/material.dart';
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
  final List<String> _title = ["Home", "Project", "Website", "PageFour"];
  int _currentIndex = 0;
  PageController _mPageController = new PageController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_currentIndex]),
        centerTitle: true,
      ),
      body: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _mPageController,
        children: <Widget>[PageOne(), PageTwo(), PageThree(), PageFour()],
        onPageChanged: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              title: Text(_title[0]),
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text(_title[1]),
              icon: Icon(Icons.computer),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text(_title[2]),
              icon: Icon(Icons.web),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              title: Text(_title[3]),
              icon: Icon(Icons.dashboard),
              backgroundColor: Colors.blue),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          _mPageController.jumpToPage(index);
          setState(() {});
        },
      ),
    );
  }
}
