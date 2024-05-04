import 'package:json_annotation/json_annotation.dart';

part 'date.dto.g.dart';

@JsonSerializable()
class DateEntity {
  @JsonKey(name: 'dplId')
  int? dplId;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'enabled')
  bool? enabled;

  @JsonKey(name: 'holidayYn')
  bool? holidayYn;

  DateEntity({this.dplId, this.date, this.enabled, this.holidayYn});

  factory DateEntity.fromJson(Map<String, dynamic> json) =>
      _$DateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DateEntityToJson(this);
}