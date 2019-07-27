import 'package:flutter/material.dart';
import 'package:flutter_app/model/useful_website_list_entity.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/http/url.dart';

class PageThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageThreeState();
  }
}

class PageThreeState extends State<PageThree> {
  List<UsefulWebsiteEntity> websiteList = [];

  @override
  void initState() {
    super.initState();
    _getUsefulWebsiteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: websiteList.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index.isOdd) {
                    return Divider();
                  }

                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(websiteList[index].name),
                  );
                },
                itemCount: websiteList.length,
              ),
              onRefresh: _loadData)
          : Center(
              child: Text("Loading..."),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> _loadData() async {
    //延迟执行
    await new Future.delayed(const Duration(seconds: 1));

    websiteList.clear();
    _getUsefulWebsiteList();

    return null;
  }

  void _getUsefulWebsiteList() async {
    Response response = await Dio().get(Url.GET_USEFUL_WEBSITE);

    print(response.data);

    UsefulWebsiteListEntity entity = UsefulWebsiteListEntity.fromJson(
        json.decode(jsonEncode(response.data)));

    websiteList = entity.data;

    setState(() {
    });
  }
}
