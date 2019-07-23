import 'package:json_annotation/json_annotation.dart';
import 'base_list_entity.dart';

part 'project_catecory_list_entity.g.dart';

@JsonSerializable()
class ProjectCategoryListEntity extends BaseListEntity<ProjectCategoryEntity> {
  ProjectCategoryListEntity();

  factory ProjectCategoryListEntity.fromJson(Map<String, dynamic> map) =>
      _$ProjectCategoryListEntityFromJson(map);

  Map<String, dynamic> toJson() => _$ProjectCategoryListEntityToJson(this);
}

@JsonSerializable()
class ProjectCategoryEntity {
  int courseId;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;
  int id;

  ProjectCategoryEntity(
      {this.courseId,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible,
      this.id});

  factory ProjectCategoryEntity.fromJson(Map<String, dynamic> map) =>
      _$ProjectCategoryEntityFromJson(map);

  Map<String, dynamic> toJson() => _$ProjectCategoryEntityToJson(this);
}
