import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/http/url.dart';
import 'package:flutter_app/model/project_catecory_list_entity.dart';
import 'dart:math';
import 'exact_project_list_page.dart';

class PageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageTwoState();
  }
}

class PageTwoState extends State<PageTwo> {
  List<ProjectCategoryEntity> categoryList = [];

  List<Color> randomColorList = [
    Colors.red,
    Colors.deepOrangeAccent,
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.blue,
    Colors.purpleAccent
  ];

  @override
  void initState() {
    super.initState();
    _getProjectCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoryList.isEmpty
          ? Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                child: RefreshProgressIndicator(),
                alignment: Alignment.topCenter,
              ))
          : Wrap(
              children: categoryList.map((entity) {
                return ActionChip(
                  label: new Text(entity.name),
                  avatar: CircleAvatar(
                    child: Text(
                      entity.name.substring(0, 1),
                      style: TextStyle(color: Colors.white),
                    ),
                    //通过随机数组随机生成颜色
                    backgroundColor: randomColorList[Random().nextInt(6)],
                  ),
                  onPressed: () {
                    print("click id is ${entity.id}");

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (buildContext) {
                      return ExactProjectListPage(entity.id);
                    }));
                  },
                );
              }).toList(),
            ),
    );
  }

  void _getProjectCategories() async {
    Response response = await Dio().get(Url.GET_PROJECT_CATEGORY);

    ProjectCategoryListEntity entity = ProjectCategoryListEntity.fromJson(
        json.decode(jsonEncode(response.data)));

    print(response.data);

    categoryList = entity?.data;

    setState(() {});
  }
}
