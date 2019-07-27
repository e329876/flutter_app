import 'package:json_annotation/json_annotation.dart';

part 'project_detail_list_entity.g.dart';

@JsonSerializable()
class ProjectDetailListEntity extends Object {
  PageEntity data;

  int errorCode;

  String errorMsg;

  ProjectDetailListEntity(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory ProjectDetailListEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$ProjectDetailListEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectDetailListEntityToJson(this);
}

@JsonSerializable()
class PageEntity extends Object {
  int curPage;

  List<ProjectDetailEntity> datas;

  int offset;

  bool over;

  int pageCount;

  int size;

  int total;

  PageEntity(
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );

  factory PageEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$PageEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageEntityToJson(this);
}

@JsonSerializable()
class ProjectDetailEntity extends Object {
  String apkLink;

  String author;

  int chapterId;

  String chapterName;

  bool collect;

  int courseId;

  String desc;

  String envelopePic;

  bool fresh;

  int id;

  String link;

  String niceDate;

  String origin;

  String prefix;

  String projectLink;

  int publishTime;

  int superChapterId;

  String superChapterName;

  List<Tags> tags;

  String title;

  int type;

  int userId;

  int visible;

  int zan;

  ProjectDetailEntity(
    this.apkLink,
    this.author,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.envelopePic,
    this.fresh,
    this.id,
    this.link,
    this.niceDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  );

  factory ProjectDetailEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$ProjectDetailEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectDetailEntityToJson(this);

  String getPublishTimeStr() {
    if (publishTime == 0) return "";

    var dayTime = DateTime.fromMillisecondsSinceEpoch(publishTime);

    return "${dayTime.year}-${dayTime.month}-${dayTime.day} ${dayTime.hour}:${dayTime.minute}";
  }
}

@JsonSerializable()
class Tags extends Object {
  String name;

  String url;

  Tags(
    this.name,
    this.url,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
