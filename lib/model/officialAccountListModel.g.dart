// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'officialAccountListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficialAccountListModel _$OfficialAccountListModelFromJson(
    Map<String, dynamic> json) {
  return OfficialAccountListModel(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : OfficialAccountEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String);
}

Map<String, dynamic> _$OfficialAccountListModelToJson(
        OfficialAccountListModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };
