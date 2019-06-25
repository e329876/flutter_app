import 'package:json_annotation/json_annotation.dart';
import 'officeAccountEntity.dart';

part 'officialAccountListModel.g.dart';

@JsonSerializable()
class OfficialAccountListModel {
  int errorCode;
  String errorMsg;
  List<OfficialAccountEntity> data;

  OfficialAccountListModel({this.data, this.errorCode, this.errorMsg});

  factory OfficialAccountListModel.fromJson(Map<String, dynamic> json) =>
      _$OfficialAccountListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialAccountListModelToJson(this);
}
