import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app/http/url.dart';
import 'package:flutter_app/model/project_detail_list_entity.dart';

import 'package:dio/dio.dart';

class ExactProjectListPage extends StatefulWidget {
  final int id;

  ExactProjectListPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return ExactProjectListPageState();
  }
}

class ExactProjectListPageState extends State<ExactProjectListPage> {
  List<ProjectDetailEntity> _projectDetailList = [];

  @override
  void initState() {
    super.initState();
    _getProjectList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_projectDetailList.isNotEmpty
              ? _projectDetailList[0].chapterName
              : "")),
      body: _projectDetailList.isNotEmpty
          ? ListView.separated(
              itemBuilder: (buildContext, index) => Center(
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        _projectDetailList[index].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ),
              separatorBuilder: (buildContext, index) => Divider(),
              itemCount: _projectDetailList.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void _getProjectList() async {
    Response response = await Dio()
        .get(Url.GET_EXACT_PROJECT_LIST, queryParameters: {"cid": widget.id});

    if (response.statusCode == 200) {
      ProjectDetailListEntity entity = ProjectDetailListEntity.fromJson(
          json.decode(jsonEncode(response.data)));
      if (entity.errorCode == 0) {
        setState(() {
          _projectDetailList = entity.data.datas;
        });
      }
    }
  }
}
