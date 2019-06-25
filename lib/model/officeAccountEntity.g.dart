// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'officeAccountEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficialAccountEntity _$OfficialAccountEntityFromJson(
    Map<String, dynamic> json) {
  return OfficialAccountEntity(
      courseId: json['courseId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      parentChapterId: json['parentChapterId'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$OfficialAccountEntityToJson(
        OfficialAccountEntity instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
