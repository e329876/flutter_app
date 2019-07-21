// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_website_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefulWebsiteListEntity _$UsefulWebsiteListEntityFromJson(
    Map<String, dynamic> json) {
  return UsefulWebsiteListEntity(
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : UsefulWebsiteEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UsefulWebsiteListEntityToJson(
        UsefulWebsiteListEntity instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data
    };

UsefulWebsiteEntity _$UsefulWebsiteEntityFromJson(Map<String, dynamic> json) {
  return UsefulWebsiteEntity(
      icon: json['icon'] as String,
      id: json['id'] as int,
      link: json['link'] as String,
      name: json['name'] as String,
      order: json['order'] as int,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$UsefulWebsiteEntityToJson(
        UsefulWebsiteEntity instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible
    };
