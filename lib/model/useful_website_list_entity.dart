import 'package:json_annotation/json_annotation.dart';

part 'useful_website_list_entity.g.dart';

@JsonSerializable()
class UsefulWebsiteListEntity {
  String errorMsg;
  int errorCode;
  List<UsefulWebsiteEntity> data;

  UsefulWebsiteListEntity({this.errorCode, this.errorMsg, this.data});

  factory UsefulWebsiteListEntity.fromJson(Map<String, dynamic> map) =>
      _$UsefulWebsiteListEntityFromJson(map);

  Map<String, dynamic> toJson() => _$UsefulWebsiteListEntityToJson(this);
}

@JsonSerializable()
class UsefulWebsiteEntity {
  String icon;
  int id;
  String link;
  String name;
  int order;
  int visible;

  UsefulWebsiteEntity(
      {this.icon, this.id, this.link, this.name, this.order, this.visible});

  factory UsefulWebsiteEntity.fromJson(Map<String, dynamic> map) =>
      _$UsefulWebsiteEntityFromJson(map);

  Map<String, dynamic> toJson() => _$UsefulWebsiteEntityToJson(this);
}
