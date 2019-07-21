// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_catecory_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectCategoryListEntity _$ProjectCategoryListEntityFromJson(
    Map<String, dynamic> json) {
  return ProjectCategoryListEntity()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectCategoryEntity.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProjectCategoryListEntityToJson(
        ProjectCategoryListEntity instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

ProjectCategoryEntity _$ProjectCategoryEntityFromJson(
    Map<String, dynamic> json) {
  return ProjectCategoryEntity(
      courseId: json['courseId'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      parentChapterId: json['parentChapterId'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$ProjectCategoryEntityToJson(
        ProjectCategoryEntity instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
