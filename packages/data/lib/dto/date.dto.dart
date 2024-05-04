import 'package:json_annotation/json_annotation.dart';

part 'date.dto.g.dart';

@JsonSerializable()
class DateDto {
  @JsonKey(name: 'dplId')
  int? dplId;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'enabled')
  bool? enabled;

  @JsonKey(name: 'holidayYn')
  bool? holidayYn;

  DateDto({this.dplId, this.date, this.enabled, this.holidayYn});

  factory DateDto.fromJson(Map<String, dynamic> json) =>
      _$DateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DateDtoToJson(this);
}