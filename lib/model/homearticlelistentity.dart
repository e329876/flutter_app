import 'package:json_annotation/json_annotation.dart';

part 'homearticlelistentity.g.dart';


@JsonSerializable()
class HomeArticleListEntity extends Object {

  @JsonKey(name: 'data')
  PageEntity data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeArticleListEntity(this.data,this.errorCode,this.errorMsg,);

  factory HomeArticleListEntity.fromJson(Map<String, dynamic> srcJson) => _$HomeArticleListEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeArticleListEntityToJson(this);

}


@JsonSerializable()
class PageEntity extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<ArticleInformEntity> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  PageEntity(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory PageEntity.fromJson(Map<String, dynamic> srcJson) => _$PageEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageEntityToJson(this);

}


@JsonSerializable()
class ArticleInformEntity extends Object {

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  ArticleInformEntity(this.apkLink,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory ArticleInformEntity.fromJson(Map<String, dynamic> srcJson) => _$ArticleInformEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleInformEntityToJson(this);

}


