import 'package:json_annotation/json_annotation.dart';

part 'officeAccountEntity.g.dart';

@JsonSerializable()
class OfficialAccountEntity {
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  OfficialAccountEntity(
      {this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible});

    factory OfficialAccountEntity.fromJson(Map<String, dynamic> json) => _$OfficialAccountEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OfficialAccountEntityToJson(this);

}
