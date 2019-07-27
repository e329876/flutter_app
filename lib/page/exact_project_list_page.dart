import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app/http/url.dart';
import 'package:flutter_app/model/project_detail_list_entity.dart';
import 'package:flutter_app/http/http_client.dart';

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
  int _currentPage = 1;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getProjectList();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _currentPage++;
        _getProjectList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_projectDetailList.isNotEmpty
              ? _projectDetailList[0].chapterName
              : "")),
      body: _projectDetailList.isNotEmpty
          ? Container(
              child: ListView.separated(
                itemBuilder: (buildContext, index) =>
                    _buildItem(_projectDetailList[index]),
                separatorBuilder: (buildContext, index) => Divider(),
                itemCount: _projectDetailList.length,
                controller: _controller,
              ),
              margin: EdgeInsets.only(bottom: 10),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildItem(ProjectDetailEntity entity) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          //项目预览图
          Image.network(
            entity.envelopePic.isNotEmpty ? entity.envelopePic : "",
            width: 80,
            height: 80,
            fit: BoxFit.fitWidth,
          ),
          //标题以及简介
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                //次要轴的对齐方式，对于column（竖向排列）来说就是横轴的对齐方式
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //标题
                  Text(
                    entity.title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  //简介
                  Text(
                    entity.desc.trim(),
                    style: TextStyle(color: Colors.black45),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  //时间和作者
                  Row(
                    children: <Widget>[
                      Text(
                        entity.author,
                        style: TextStyle(color: Colors.blue),
                      ),
                      Expanded(
                        child: Text(
                          entity.getPublishTimeStr(),
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black45),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: null));
      },
    );
  }

  void _getProjectList() async {
    Response response = await HttpClient.getInstance().dio.get(
        Url.buildPageUrl(Url.GET_EXACT_PROJECT_LIST, _currentPage),
        queryParameters: {"cid": widget.id});

    if (response.statusCode == 200) {
      ProjectDetailListEntity entity = ProjectDetailListEntity.fromJson(
          json.decode(jsonEncode(response.data)));
      if (entity.errorCode == 0) {
        setState(() {
          if (_projectDetailList.isEmpty) {
            _projectDetailList = entity.data.datas;
          } else {
            _projectDetailList.addAll(entity.data.datas);
          }
        });
      }
    }
  }
}
