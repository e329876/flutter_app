import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/model/officialAccountListModel.dart';
import 'package:flutter_app/model/officeAccountEntity.dart';
import 'package:toast/toast.dart';
import 'package:flutter_app/http/url.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_app/model/bannerListEntity.dart';

class PageOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageOneState();
  }
}

class PageOneState extends State<PageOne> with AutomaticKeepAliveClientMixin {
  OfficialAccountListModel _jsonModel;
  BannerListEntity _bannerList;
  List<OfficialAccountEntity> _officialAccountDatas = [];
  List<Widget> _bannerWidgets = [];
  BuildContext _mContext;

  void _getJsonContent() async {
    Response response = await Dio().get(Url.GET_OFFICIAL_ACCOUNT_LIST);

    //此处dio response.data.toString()获得的json是不带双引号的不规范json,所以需要使用
    //jsonEncode再转一下再进行转成model
    _jsonModel = OfficialAccountListModel.fromJson(
        json.decode(jsonEncode(response.data)));

    if (_jsonModel != null) {
      _officialAccountDatas = _jsonModel.data;
    }

    debugPrint("test update");

    setState(() {});
  }

  void _getBanners() async {
    Response response = await Dio().get(Url.GET_BANNER_LIST);

    //此处dio response.data.toString()获得的json是不带双引号的不规范json,所以需要使用
    //jsonEncode再转一下再进行转成model
    _bannerList =
        BannerListEntity.fromJson(json.decode(jsonEncode(response.data)));

    if (_bannerList != null) {
      _bannerWidgets = _bannerList.data.map((item) {
        return GestureDetector(
            child: Image.network(
              item.imagePath,
              height: 200,
            ),
            onTap: () {
              Toast.show("item title is ${item.title}", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            });
      }).toList();
    }

    //获取完Banner后继续获取接下来的数据
    _getJsonContent();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _mContext = context;
    _getBanners();

    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            alignment: Alignment.center,
            height: 200,
            child: BannerView(
              _bannerWidgets,
              intervalDuration: Duration(seconds: 2),
            ),
          );
        } else {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Text(_officialAccountDatas[index].name),
              ),
            ),
            onTap: () {
              Toast.show(
                  "name is ${_officialAccountDatas[index].name} ", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            },
          );
        }
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: _officialAccountDatas.length,
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
